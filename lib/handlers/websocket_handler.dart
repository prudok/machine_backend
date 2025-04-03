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

  Handler get handler => webSocketHandler(
        (WebSocketChannel socket) {
          String roomId = 'room_1';
          roomSockets.putIfAbsent(roomId, () => []).add(socket);

          Timer.periodic(
            Duration(seconds: 5),
            (_) async {
              final machines = await db.select(db.machines).get();
              machines.shuffle();
              final statuses = [
                MachineStatus.processing,
                MachineStatus.idle,
                MachineStatus.turnedOff,
                MachineStatus.turnedOn
              ];

              for (var i = 0; i < machines.length; i++) {
                await (db.update(db.machines)..where((tbl) => tbl.id.equals(machines[i].id))).write(
                  MachinesCompanion(status: Value(statuses[i % statuses.length])),
                );
              }

              final updatedMachines = await db.select(db.machines).get();
              final jsonData = jsonEncode(updatedMachines
                  .map((m) => {'id': m.id, 'name': m.name, 'status': m.status.name, 'imageUrl': m.imageUrl})
                  .toList());

              roomSockets[roomId]?.forEach((s) => s.sink.add(jsonData));
            },
          );

          // socket.sink.close().then((_) => roomSockets[roomId]?.remove(socket));
        },
      );
}
