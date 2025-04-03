import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:machine_backend/models/machine_type.dart';
import 'package:machine_backend/models/machines.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
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
    if (count.isEmpty) {
      await batch((batch) {
        batch.insertAll(machines, [
          MachinesCompanion.insert(
            name: 'Резак 3000',
            width: 2.5,
            height: 1.5,
            powerConsumption: 15,
            type: MachineType.cutting,
            description: Value('Высокоточный резак'),
          ),
          MachinesCompanion.insert(
            name: 'Фрезер ABC',
            width: 3.0,
            height: 2.0,
            powerConsumption: 20,
            type: MachineType.milling,
            description: Value('Мощный фрезерный станок'),
          ),
          MachinesCompanion.insert(
            name: 'Дрель М-250',
            width: 1.0,
            height: 1.8,
            powerConsumption: 10,
            type: MachineType.drilling,
            description: Value('Промышленная дрель'),
          ),
          MachinesCompanion.insert(
            name: 'Полировщик SoftPolish',
            width: 1.5,
            height: 1.2,
            powerConsumption: 8,
            type: MachineType.polishing,
            description: Value('Точное полирование поверхностей'),
          ),
          MachinesCompanion.insert(
            name: 'Многоцелевой станок Omni-Tool',
            width: 2.8,
            height: 2.2,
            powerConsumption: 22,
            type: MachineType.other,
            description: Value('Универсальный инструмент'),
          ),
        ]);
      });
    }
  }
}
