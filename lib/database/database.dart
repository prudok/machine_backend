import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:machine_backend/models/machine_status.dart';
import 'package:machine_backend/models/machine_type.dart';
import 'package:machine_backend/models/machines.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File(p.join('', 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Machines])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Добавление моковых машин при запуске
  Future<void> insertMockMachinesIfEmpty() async {
    final count = await select(machines).get();
    if (count.isNotEmpty) {
      return;
    }

    await batch((batch) {
      batch.insertAll(machines, [
        MachinesCompanion.insert(
          name: 'Резак 3000',
          powerConsumption: 15,
          type: MachineType.cutting,
          imageUrl: Value('https://i.imgur.com/cutting.png'),
        ),
        MachinesCompanion.insert(
          name: 'Фрезер ABC',
          powerConsumption: 20,
          type: MachineType.milling,
          imageUrl: Value('https://i.imgur.com/milling.png'),
        ),
        MachinesCompanion.insert(
          name: 'Дрель М-250',
          powerConsumption: 10,
          type: MachineType.drilling,
          imageUrl: Value('https://i.imgur.com/drilling.png'),
        ),
        MachinesCompanion.insert(
          name: 'Полировщик SoftPolish',
          powerConsumption: 8,
          type: MachineType.polishing,
          imageUrl: Value('https://i.imgur.com/polishing.png'),
        ),
        MachinesCompanion.insert(
          name: 'Omni-Tool',
          powerConsumption: 22,
          type: MachineType.other,
          imageUrl: Value('https://i.imgur.com/other.png'),
        ),
      ]);
    });
  }
}
