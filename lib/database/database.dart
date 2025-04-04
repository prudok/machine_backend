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

  Future<void> insertMockMachinesIfEmpty() async {
    final count = await select(machines).get();
    if (count.isNotEmpty) {
      return;
    }

    await batch((batch) {
      batch.insertAll(machines, [
        MachinesCompanion.insert(
          name: 'ULVAC SME-200 Sputtering System',
          powerConsumption: 18,
          type: MachineType.other,
          imageUrl: Value(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeUWlNPc919kFgXUf_PSI_9ZLo4DT6aVBHJYndL7sDIdKMmYoxUQvXbAw4RK0Pu8D20L8&usqp=CAU',
          ),
          description: Value(
            'Система ионно-вакуумного напыления, используемая для нанесения прозрачных электропроводящих слоёв (ITO/Ag) на стеклянные или пластиковые подложки сенсорных экранов.',
          ),
        ),
        MachinesCompanion.insert(
          name: 'SCREEN SK-W80A Coating Equipment',
          powerConsumption: 15,
          type: MachineType.other,
          imageUrl: Value(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMeqSuYJLqBkc-dur2E7ASFoCgjYsvJpPjuA&s',
          ),
          description: Value(
            'Автоматизированная установка для нанесения фоторезиста методом центрифугирования, обеспечивает равномерное покрытие подложек с высокой точностью по толщине слоя.',
          ),
        ),
        MachinesCompanion.insert(
          name: 'Heller 1913 MK III Reflow Oven',
          powerConsumption: 25,
          type: MachineType.other,
          imageUrl: Value('https://s.alicdn.com/@sc04/kf/Hddb1c256c53e4001b238d77996f19e7dX.jpg'),
          description: Value(
            'Многозонная печь оплавления с контролем профиля температуры, предназначена для сушки, запекания и закалки покрытий, включая полимерные и проводящие слои.',
          ),
        ),
        MachinesCompanion.insert(
          name: 'C SUN SMT-320 PCB Separator',
          powerConsumption: 10,
          type: MachineType.cutting,
          imageUrl: Value(
            'https://5.imimg.com/data5/LN/WH/MY-8669722/leather-processing-machine-250x250.png',
          ),
          description: Value(
            'Прецизионная машина для деления больших подложек на отдельные панели сенсорных экранов. Позволяет минимизировать механические напряжения и микротрещины.',
          ),
        ),
        MachinesCompanion.insert(
          name: 'Toray Engineering Flip Chip Bonder FC3000',
          powerConsumption: 20,
          type: MachineType.other,
          imageUrl: Value(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnFNs2Co3dgXMNifXyUoL60JlhLaraAGXQC8Fvsao7xk18CGdU6n1gcIHMJr2vi5plx-E&usqp=CAU',
          ),
          description: Value(
            'Высокоточная установка для соединения микрочипов с подложкой методом перевёрнутого монтажа. Обеспечивает выравнивание, прижим и термосжатие под микроскопическим контролем.',
          ),
        ),
        MachinesCompanion.insert(
          name: 'Nordson ASYMTEK SL-940E Selective Conformal Coating',
          powerConsumption: 12,
          type: MachineType.other,
          imageUrl: Value(
            'https://p.globalsources.com/IMAGES/PDT/B1082018676/leather-cell-phone-case-making-machine.jpg',
          ),
          description: Value(
            'Система селективного нанесения защитных полимерных покрытий. Используется для герметизации и защиты контактных поверхностей и дорожек сенсорных экранов.',
          ),
        ),
      ]);
    });
  }
}
