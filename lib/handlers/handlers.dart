import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:machine_backend/handlers/websocket_handler.dart';
import 'package:machine_backend/models/machine_type.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../database/database.dart';

class MachineApi {
  final AppDatabase db;

  MachineApi(this.db);

  Handler get handler {
    final router = Router();

    router.get('/machines', (Request request) async {
      final machines = await db.select(db.machines).get();
      return Response.ok(jsonEncode(machines));
    });

    router.post(
      '/machines',
      (Request request) async {
        final body = await request.readAsString();
        final data = jsonDecode(body);

        late final MachineType type;
        try {
          type = MachineType.values.byName(data['type']);
        } catch (_) {
          type = MachineType.other;
        }

        final machinesCompanion = MachinesCompanion.insert(
          name: data['name'],
          powerConsumption: data['powerConsumption'],
          type: type,
          description: Value(data['description']),
          imageUrl: Value(data['imageUrl']),
        );
        await db.into(db.machines).insert(machinesCompanion);

        return Response.ok('Machine added');
      },
    );

    router.delete('/machines/<id|[0-9]+>', (Request request, String id) async {
      final machineId = int.parse(id);

      final deleted = await (db.delete(db.machines)..where((tbl) => tbl.id.equals(machineId))).go();
      return deleted > 0 ? Response.ok('Deleted successfully') : Response.notFound('Machine not found');
    });

    router.put(
      '/machines/<id|[0-9]+>',
      (Request request, String id) async {
        final body = await request.readAsString();
        final data = jsonDecode(body);

        final machinesCompanion = MachinesCompanion(
          name: Value(data['name']),
          powerConsumption: Value(data['powerConsumption']),
          type: Value(MachineType.values.byName(data['type'])),
          description: Value(
            data['description'],
          ),
        );

        final updated = await db.update(db.machines).replace(machinesCompanion);
        return updated ? Response.ok('Updated successfully') : Response.notFound('Machine not found');
      },
    );

    router.post('/machines', (Request request) async {
      final body = await request.readAsString();
      final data = jsonDecode(body);
      final machinesCompanion = MachinesCompanion.insert(
        name: data['name'],
        powerConsumption: data['powerConsumption'],
        type: MachineType.values.byName(data['type']),
        description: data['description'],
        imageUrl: Value(data['imageUrl']),
      );

      await db.into(db.machines).insert(machinesCompanion);

      final wsHandler = WebSocketHandler(db);
      await wsHandler.broadcastMachines('room_1');

      return Response.ok('Machine added and broadcasted');
    });

    return router;
  }
}
