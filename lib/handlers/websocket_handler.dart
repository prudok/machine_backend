import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:machine_backend/database/database.dart';
import 'package:machine_backend/models/machine_status.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketHandler {
  final AppDatabase db;

  WebSocketHandler(this.db);

  final Map<String, List<WebSocketChannel>> roomSockets = {};
  Timer? cycleTimer;

  Handler get handler => webSocketHandler((WebSocketChannel socket) {
        late final String roomId;

        socket.stream.listen((event) async {
          try {
            final data = jsonDecode(event);
            roomId = data['roomId'] ?? 'room_1';

            roomSockets.putIfAbsent(roomId, () => []).add(socket);

            await _startCycle(roomId);
          } catch (_) {
            // игнорируем невалидный json
          }
        }, onDone: () {
          roomSockets[roomId]?.remove(socket);
          if ((roomSockets[roomId]?.isEmpty ?? true)) {
            cycleTimer?.cancel();
          }
        });
      });

  Future<void> _startCycle(String roomId) async {
    final allMachines = await db.select(db.machines).get();
    final machines = roomId == 'room_1' ? allMachines : allMachines.where((m) => m.id.isOdd).toList();

    machines.sort((a, b) => a.id.compareTo(b.id));
    cycleTimer?.cancel();

    cycleTimer = Timer.periodic(Duration(seconds: 3), (timer) async {
      final currentStep = timer.tick % (machines.length + 2);

      if (currentStep == 0) {
        for (var m in machines) {
          await (db.update(db.machines)..where((tbl) => tbl.id.equals(m.id)))
              .write(MachinesCompanion(status: Value(MachineStatus.turnedOff)));
        }
      } else if (currentStep <= machines.length) {
        final active = machines[currentStep - 1];
        await (db.update(db.machines)..where((t) => t.id.equals(active.id)))
            .write(MachinesCompanion(status: Value(MachineStatus.processing)));

        if (currentStep < machines.length) {
          final next = machines[currentStep];
          await (db.update(db.machines)..where((t) => t.id.equals(next.id)))
              .write(MachinesCompanion(status: Value(MachineStatus.turnedOn)));
        }

        for (var i = 0; i < currentStep - 1; i++) {
          await (db.update(db.machines)..where((t) => t.id.equals(machines[i].id)))
              .write(MachinesCompanion(status: Value(MachineStatus.turnedOff)));
        }
      } else {
        for (var m in machines) {
          await (db.update(db.machines)..where((t) => t.id.equals(m.id)))
              .write(MachinesCompanion(status: Value(MachineStatus.idle)));
        }
      }

      final updated = await db.select(db.machines).get();
      final filtered = roomId == 'room_1' ? updated : updated.where((m) => m.id.isOdd).toList();

      final jsonData = jsonEncode(filtered
          .map((m) => {
                'id': m.id,
                'name': m.name,
                'status': m.status.name,
                'imageUrl': m.imageUrl,
                'description': m.description,
              })
          .toList());

      roomSockets[roomId]?.forEach((s) => s.sink.add(jsonData));
    });
  }

  Future<void> broadcastMachines(String roomId) async {
    final updatedMachines = await db.select(db.machines).get();
    updatedMachines.sort((a, b) => a.id.compareTo(b.id));

    final jsonData = jsonEncode(updatedMachines
        .map((m) => {
              'id': m.id,
              'name': m.name,
              'status': m.status.name,
              'imageUrl': m.imageUrl,
              'description': m.description,
            })
        .toList());

    roomSockets[roomId]?.forEach((s) => s.sink.add(jsonData));
  }
}
