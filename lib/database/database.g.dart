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
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<double> width = GeneratedColumn<double>(
      'width', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
      'height', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, width, height, powerConsumption, type, description];
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
    if (data.containsKey('width')) {
      context.handle(
          _widthMeta, width.isAcceptableOrUnknown(data['width']!, _widthMeta));
    } else if (isInserting) {
      context.missing(_widthMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
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
      width: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}width'])!,
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height'])!,
      powerConsumption: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}power_consumption'])!,
      type: $MachinesTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $MachinesTable createAlias(String alias) {
    return $MachinesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MachineType, String, String> $convertertype =
      const EnumNameConverter<MachineType>(MachineType.values);
}

class Machine extends DataClass implements Insertable<Machine> {
  final int id;
  final String name;
  final double width;
  final double height;
  final double powerConsumption;
  final MachineType type;
  final String? description;
  const Machine(
      {required this.id,
      required this.name,
      required this.width,
      required this.height,
      required this.powerConsumption,
      required this.type,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['width'] = Variable<double>(width);
    map['height'] = Variable<double>(height);
    map['power_consumption'] = Variable<double>(powerConsumption);
    {
      map['type'] = Variable<String>($MachinesTable.$convertertype.toSql(type));
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  MachinesCompanion toCompanion(bool nullToAbsent) {
    return MachinesCompanion(
      id: Value(id),
      name: Value(name),
      width: Value(width),
      height: Value(height),
      powerConsumption: Value(powerConsumption),
      type: Value(type),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Machine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Machine(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      width: serializer.fromJson<double>(json['width']),
      height: serializer.fromJson<double>(json['height']),
      powerConsumption: serializer.fromJson<double>(json['powerConsumption']),
      type: $MachinesTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'width': serializer.toJson<double>(width),
      'height': serializer.toJson<double>(height),
      'powerConsumption': serializer.toJson<double>(powerConsumption),
      'type':
          serializer.toJson<String>($MachinesTable.$convertertype.toJson(type)),
      'description': serializer.toJson<String?>(description),
    };
  }

  Machine copyWith(
          {int? id,
          String? name,
          double? width,
          double? height,
          double? powerConsumption,
          MachineType? type,
          Value<String?> description = const Value.absent()}) =>
      Machine(
        id: id ?? this.id,
        name: name ?? this.name,
        width: width ?? this.width,
        height: height ?? this.height,
        powerConsumption: powerConsumption ?? this.powerConsumption,
        type: type ?? this.type,
        description: description.present ? description.value : this.description,
      );
  Machine copyWithCompanion(MachinesCompanion data) {
    return Machine(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      powerConsumption: data.powerConsumption.present
          ? data.powerConsumption.value
          : this.powerConsumption,
      type: data.type.present ? data.type.value : this.type,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Machine(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('powerConsumption: $powerConsumption, ')
          ..write('type: $type, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, width, height, powerConsumption, type, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Machine &&
          other.id == this.id &&
          other.name == this.name &&
          other.width == this.width &&
          other.height == this.height &&
          other.powerConsumption == this.powerConsumption &&
          other.type == this.type &&
          other.description == this.description);
}

class MachinesCompanion extends UpdateCompanion<Machine> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> width;
  final Value<double> height;
  final Value<double> powerConsumption;
  final Value<MachineType> type;
  final Value<String?> description;
  const MachinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.powerConsumption = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
  });
  MachinesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double width,
    required double height,
    required double powerConsumption,
    required MachineType type,
    this.description = const Value.absent(),
  })  : name = Value(name),
        width = Value(width),
        height = Value(height),
        powerConsumption = Value(powerConsumption),
        type = Value(type);
  static Insertable<Machine> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? width,
    Expression<double>? height,
    Expression<double>? powerConsumption,
    Expression<String>? type,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (powerConsumption != null) 'power_consumption': powerConsumption,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
    });
  }

  MachinesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? width,
      Value<double>? height,
      Value<double>? powerConsumption,
      Value<MachineType>? type,
      Value<String?>? description}) {
    return MachinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      width: width ?? this.width,
      height: height ?? this.height,
      powerConsumption: powerConsumption ?? this.powerConsumption,
      type: type ?? this.type,
      description: description ?? this.description,
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
    if (width.present) {
      map['width'] = Variable<double>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (powerConsumption.present) {
      map['power_consumption'] = Variable<double>(powerConsumption.value);
    }
    if (type.present) {
      map['type'] =
          Variable<String>($MachinesTable.$convertertype.toSql(type.value));
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MachinesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('powerConsumption: $powerConsumption, ')
          ..write('type: $type, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MachinesTable machines = $MachinesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [machines];
}

typedef $$MachinesTableCreateCompanionBuilder = MachinesCompanion Function({
  Value<int> id,
  required String name,
  required double width,
  required double height,
  required double powerConsumption,
  required MachineType type,
  Value<String?> description,
});
typedef $$MachinesTableUpdateCompanionBuilder = MachinesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<double> width,
  Value<double> height,
  Value<double> powerConsumption,
  Value<MachineType> type,
  Value<String?> description,
});

class $$MachinesTableFilterComposer
    extends Composer<_$AppDatabase, $MachinesTable> {
  $$MachinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get width => $composableBuilder(
      column: $table.width, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get powerConsumption => $composableBuilder(
      column: $table.powerConsumption,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MachineType, MachineType, String> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));
}

class $$MachinesTableOrderingComposer
    extends Composer<_$AppDatabase, $MachinesTable> {
  $$MachinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get width => $composableBuilder(
      column: $table.width, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get powerConsumption => $composableBuilder(
      column: $table.powerConsumption,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$MachinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MachinesTable> {
  $$MachinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<double> get powerConsumption => $composableBuilder(
      column: $table.powerConsumption, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MachineType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);
}

class $$MachinesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MachinesTable,
    Machine,
    $$MachinesTableFilterComposer,
    $$MachinesTableOrderingComposer,
    $$MachinesTableAnnotationComposer,
    $$MachinesTableCreateCompanionBuilder,
    $$MachinesTableUpdateCompanionBuilder,
    (Machine, BaseReferences<_$AppDatabase, $MachinesTable, Machine>),
    Machine,
    PrefetchHooks Function()> {
  $$MachinesTableTableManager(_$AppDatabase db, $MachinesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MachinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MachinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MachinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> width = const Value.absent(),
            Value<double> height = const Value.absent(),
            Value<double> powerConsumption = const Value.absent(),
            Value<MachineType> type = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              MachinesCompanion(
            id: id,
            name: name,
            width: width,
            height: height,
            powerConsumption: powerConsumption,
            type: type,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required double width,
            required double height,
            required double powerConsumption,
            required MachineType type,
            Value<String?> description = const Value.absent(),
          }) =>
              MachinesCompanion.insert(
            id: id,
            name: name,
            width: width,
            height: height,
            powerConsumption: powerConsumption,
            type: type,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MachinesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MachinesTable,
    Machine,
    $$MachinesTableFilterComposer,
    $$MachinesTableOrderingComposer,
    $$MachinesTableAnnotationComposer,
    $$MachinesTableCreateCompanionBuilder,
    $$MachinesTableUpdateCompanionBuilder,
    (Machine, BaseReferences<_$AppDatabase, $MachinesTable, Machine>),
    Machine,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MachinesTableTableManager get machines =>
      $$MachinesTableTableManager(_db, _db.machines);
}
