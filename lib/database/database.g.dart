// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MachinesTable extends Machines with TableInfo<$MachinesTable, Machine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MachinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _powerConsumptionMeta =
      const VerificationMeta('powerConsumption');
  @override
  late final GeneratedColumn<double> powerConsumption = GeneratedColumn<double>(
      'power_consumption', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<MachineType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<MachineType>($MachinesTable.$convertertype);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<MachineStatus, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant('idle'))
          .withConverter<MachineStatus>($MachinesTable.$converterstatus);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, powerConsumption, type, status, description, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'machines';
  @override
  VerificationContext validateIntegrity(Insertable<Machine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('power_consumption')) {
      context.handle(
          _powerConsumptionMeta,
          powerConsumption.isAcceptableOrUnknown(
              data['power_consumption']!, _powerConsumptionMeta));
    } else if (isInserting) {
      context.missing(_powerConsumptionMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Machine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Machine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      powerConsumption: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}power_consumption'])!,
      type: $MachinesTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      status: $MachinesTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
    );
  }

  @override
  $MachinesTable createAlias(String alias) {
    return $MachinesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MachineType, String, String> $convertertype =
      const EnumNameConverter<MachineType>(MachineType.values);
  static JsonTypeConverter2<MachineStatus, String, String> $converterstatus =
      const EnumNameConverter<MachineStatus>(MachineStatus.values);
}

class Machine extends DataClass implements Insertable<Machine> {
  final int id;
  final String name;
  final double powerConsumption;
  final MachineType type;
  final MachineStatus status;
  final String? description;
  final String? imageUrl;
  const Machine(
      {required this.id,
      required this.name,
      required this.powerConsumption,
      required this.type,
      required this.status,
      this.description,
      this.imageUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['power_consumption'] = Variable<double>(powerConsumption);
    {
      map['type'] = Variable<String>($MachinesTable.$convertertype.toSql(type));
    }
    {
      map['status'] =
          Variable<String>($MachinesTable.$converterstatus.toSql(status));
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    return map;
  }

  MachinesCompanion toCompanion(bool nullToAbsent) {
    return MachinesCompanion(
      id: Value(id),
      name: Value(name),
      powerConsumption: Value(powerConsumption),
      type: Value(type),
      status: Value(status),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
    );
  }

  factory Machine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Machine(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      powerConsumption: serializer.fromJson<double>(json['powerConsumption']),
      type: $MachinesTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      status: $MachinesTable.$converterstatus
          .fromJson(serializer.fromJson<String>(json['status'])),
      description: serializer.fromJson<String?>(json['description']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'powerConsumption': serializer.toJson<double>(powerConsumption),
      'type':
          serializer.toJson<String>($MachinesTable.$convertertype.toJson(type)),
      'status': serializer
          .toJson<String>($MachinesTable.$converterstatus.toJson(status)),
      'description': serializer.toJson<String?>(description),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  Machine copyWith(
          {int? id,
          String? name,
          double? powerConsumption,
          MachineType? type,
          MachineStatus? status,
          Value<String?> description = const Value.absent(),
          Value<String?> imageUrl = const Value.absent()}) =>
      Machine(
        id: id ?? this.id,
        name: name ?? this.name,
        powerConsumption: powerConsumption ?? this.powerConsumption,
        type: type ?? this.type,
        status: status ?? this.status,
        description: description.present ? description.value : this.description,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
      );
  @override
  String toString() {
    return (StringBuffer('Machine(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('powerConsumption: $powerConsumption, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, powerConsumption, type, status, description, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Machine &&
          other.id == this.id &&
          other.name == this.name &&
          other.powerConsumption == this.powerConsumption &&
          other.type == this.type &&
          other.status == this.status &&
          other.description == this.description &&
          other.imageUrl == this.imageUrl);
}

class MachinesCompanion extends UpdateCompanion<Machine> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> powerConsumption;
  final Value<MachineType> type;
  final Value<MachineStatus> status;
  final Value<String?> description;
  final Value<String?> imageUrl;
  const MachinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.powerConsumption = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  MachinesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double powerConsumption,
    required MachineType type,
    this.status = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
  })  : name = Value(name),
        powerConsumption = Value(powerConsumption),
        type = Value(type);
  static Insertable<Machine> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? powerConsumption,
    Expression<String>? type,
    Expression<String>? status,
    Expression<String>? description,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (powerConsumption != null) 'power_consumption': powerConsumption,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (description != null) 'description': description,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  MachinesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? powerConsumption,
      Value<MachineType>? type,
      Value<MachineStatus>? status,
      Value<String?>? description,
      Value<String?>? imageUrl}) {
    return MachinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      powerConsumption: powerConsumption ?? this.powerConsumption,
      type: type ?? this.type,
      status: status ?? this.status,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (powerConsumption.present) {
      map['power_consumption'] = Variable<double>(powerConsumption.value);
    }
    if (type.present) {
      map['type'] =
          Variable<String>($MachinesTable.$convertertype.toSql(type.value));
    }
    if (status.present) {
      map['status'] =
          Variable<String>($MachinesTable.$converterstatus.toSql(status.value));
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MachinesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('powerConsumption: $powerConsumption, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $MachinesTable machines = $MachinesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [machines];
}

typedef $$MachinesTableInsertCompanionBuilder = MachinesCompanion Function({
  Value<int> id,
  required String name,
  required double powerConsumption,
  required MachineType type,
  Value<MachineStatus> status,
  Value<String?> description,
  Value<String?> imageUrl,
});
typedef $$MachinesTableUpdateCompanionBuilder = MachinesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<double> powerConsumption,
  Value<MachineType> type,
  Value<MachineStatus> status,
  Value<String?> description,
  Value<String?> imageUrl,
});

class $$MachinesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MachinesTable,
    Machine,
    $$MachinesTableFilterComposer,
    $$MachinesTableOrderingComposer,
    $$MachinesTableProcessedTableManager,
    $$MachinesTableInsertCompanionBuilder,
    $$MachinesTableUpdateCompanionBuilder> {
  $$MachinesTableTableManager(_$AppDatabase db, $MachinesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MachinesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MachinesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MachinesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> powerConsumption = const Value.absent(),
            Value<MachineType> type = const Value.absent(),
            Value<MachineStatus> status = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
          }) =>
              MachinesCompanion(
            id: id,
            name: name,
            powerConsumption: powerConsumption,
            type: type,
            status: status,
            description: description,
            imageUrl: imageUrl,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required double powerConsumption,
            required MachineType type,
            Value<MachineStatus> status = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
          }) =>
              MachinesCompanion.insert(
            id: id,
            name: name,
            powerConsumption: powerConsumption,
            type: type,
            status: status,
            description: description,
            imageUrl: imageUrl,
          ),
        ));
}

class $$MachinesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $MachinesTable,
    Machine,
    $$MachinesTableFilterComposer,
    $$MachinesTableOrderingComposer,
    $$MachinesTableProcessedTableManager,
    $$MachinesTableInsertCompanionBuilder,
    $$MachinesTableUpdateCompanionBuilder> {
  $$MachinesTableProcessedTableManager(super.$state);
}

class $$MachinesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MachinesTable> {
  $$MachinesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get powerConsumption => $state.composableBuilder(
      column: $state.table.powerConsumption,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<MachineType, MachineType, String> get type =>
      $state.composableBuilder(
          column: $state.table.type,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<MachineStatus, MachineStatus, String>
      get status => $state.composableBuilder(
          column: $state.table.status,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MachinesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MachinesTable> {
  $$MachinesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get powerConsumption => $state.composableBuilder(
      column: $state.table.powerConsumption,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$MachinesTableTableManager get machines =>
      $$MachinesTableTableManager(_db, _db.machines);
}
