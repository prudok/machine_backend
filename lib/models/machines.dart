import 'package:drift/drift.dart';
import 'package:machine_backend/models/machine_type.dart';

class Machines extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get width => real()();
  RealColumn get height => real()();
  RealColumn get powerConsumption => real()();
  TextColumn get type => textEnum<MachineType>()();
  TextColumn get description => text().nullable()();
}
