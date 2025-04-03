import 'package:drift/drift.dart';
import 'package:machine_backend/models/machine_status.dart';
import 'package:machine_backend/models/machine_type.dart';

class Machines extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get powerConsumption => real()();
  TextColumn get type => textEnum<MachineType>()();
  TextColumn get status => textEnum<MachineStatus>().withDefault(Constant('idle'))();
  TextColumn get description => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
}
