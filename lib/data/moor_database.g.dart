// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ProductListData extends DataClass implements Insertable<ProductListData> {
  final int id;
  final String designCode;
  final String inputText;
  final String inputChoice;
  ProductListData(
      {@required this.id,
      @required this.designCode,
      @required this.inputText,
      @required this.inputChoice});
  factory ProductListData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ProductListData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      designCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}design_code']),
      inputText: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}input_text']),
      inputChoice: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}input_choice']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || designCode != null) {
      map['design_code'] = Variable<String>(designCode);
    }
    if (!nullToAbsent || inputText != null) {
      map['input_text'] = Variable<String>(inputText);
    }
    if (!nullToAbsent || inputChoice != null) {
      map['input_choice'] = Variable<String>(inputChoice);
    }
    return map;
  }

  ProductListCompanion toCompanion(bool nullToAbsent) {
    return ProductListCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      designCode: designCode == null && nullToAbsent
          ? const Value.absent()
          : Value(designCode),
      inputText: inputText == null && nullToAbsent
          ? const Value.absent()
          : Value(inputText),
      inputChoice: inputChoice == null && nullToAbsent
          ? const Value.absent()
          : Value(inputChoice),
    );
  }

  factory ProductListData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductListData(
      id: serializer.fromJson<int>(json['id']),
      designCode: serializer.fromJson<String>(json['designCode']),
      inputText: serializer.fromJson<String>(json['inputText']),
      inputChoice: serializer.fromJson<String>(json['inputChoice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'designCode': serializer.toJson<String>(designCode),
      'inputText': serializer.toJson<String>(inputText),
      'inputChoice': serializer.toJson<String>(inputChoice),
    };
  }

  ProductListData copyWith(
          {int id, String designCode, String inputText, String inputChoice}) =>
      ProductListData(
        id: id ?? this.id,
        designCode: designCode ?? this.designCode,
        inputText: inputText ?? this.inputText,
        inputChoice: inputChoice ?? this.inputChoice,
      );
  @override
  String toString() {
    return (StringBuffer('ProductListData(')
          ..write('id: $id, ')
          ..write('designCode: $designCode, ')
          ..write('inputText: $inputText, ')
          ..write('inputChoice: $inputChoice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(designCode.hashCode,
          $mrjc(inputText.hashCode, inputChoice.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ProductListData &&
          other.id == this.id &&
          other.designCode == this.designCode &&
          other.inputText == this.inputText &&
          other.inputChoice == this.inputChoice);
}

class ProductListCompanion extends UpdateCompanion<ProductListData> {
  final Value<int> id;
  final Value<String> designCode;
  final Value<String> inputText;
  final Value<String> inputChoice;
  const ProductListCompanion({
    this.id = const Value.absent(),
    this.designCode = const Value.absent(),
    this.inputText = const Value.absent(),
    this.inputChoice = const Value.absent(),
  });
  ProductListCompanion.insert({
    this.id = const Value.absent(),
    this.designCode = const Value.absent(),
    @required String inputText,
    @required String inputChoice,
  })  : inputText = Value(inputText),
        inputChoice = Value(inputChoice);
  static Insertable<ProductListData> custom({
    Expression<int> id,
    Expression<String> designCode,
    Expression<String> inputText,
    Expression<String> inputChoice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (designCode != null) 'design_code': designCode,
      if (inputText != null) 'input_text': inputText,
      if (inputChoice != null) 'input_choice': inputChoice,
    });
  }

  ProductListCompanion copyWith(
      {Value<int> id,
      Value<String> designCode,
      Value<String> inputText,
      Value<String> inputChoice}) {
    return ProductListCompanion(
      id: id ?? this.id,
      designCode: designCode ?? this.designCode,
      inputText: inputText ?? this.inputText,
      inputChoice: inputChoice ?? this.inputChoice,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (designCode.present) {
      map['design_code'] = Variable<String>(designCode.value);
    }
    if (inputText.present) {
      map['input_text'] = Variable<String>(inputText.value);
    }
    if (inputChoice.present) {
      map['input_choice'] = Variable<String>(inputChoice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductListCompanion(')
          ..write('id: $id, ')
          ..write('designCode: $designCode, ')
          ..write('inputText: $inputText, ')
          ..write('inputChoice: $inputChoice')
          ..write(')'))
        .toString();
  }
}

class $ProductListTable extends ProductList
    with TableInfo<$ProductListTable, ProductListData> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProductListTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _designCodeMeta = const VerificationMeta('designCode');
  GeneratedTextColumn _designCode;
  @override
  GeneratedTextColumn get designCode => _designCode ??= _constructDesignCode();
  GeneratedTextColumn _constructDesignCode() {
    return GeneratedTextColumn(
      'design_code',
      $tableName,
      false,
    )..clientDefault = () => '';
  }

  final VerificationMeta _inputTextMeta = const VerificationMeta('inputText');
  GeneratedTextColumn _inputText;
  @override
  GeneratedTextColumn get inputText => _inputText ??= _constructInputText();
  GeneratedTextColumn _constructInputText() {
    return GeneratedTextColumn(
      'input_text',
      $tableName,
      false,
    );
  }

  final VerificationMeta _inputChoiceMeta =
      const VerificationMeta('inputChoice');
  GeneratedTextColumn _inputChoice;
  @override
  GeneratedTextColumn get inputChoice =>
      _inputChoice ??= _constructInputChoice();
  GeneratedTextColumn _constructInputChoice() {
    return GeneratedTextColumn(
      'input_choice',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, designCode, inputText, inputChoice];
  @override
  $ProductListTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'products';
  @override
  final String actualTableName = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<ProductListData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('design_code')) {
      context.handle(
          _designCodeMeta,
          designCode.isAcceptableOrUnknown(
              data['design_code'], _designCodeMeta));
    }
    if (data.containsKey('input_text')) {
      context.handle(_inputTextMeta,
          inputText.isAcceptableOrUnknown(data['input_text'], _inputTextMeta));
    } else if (isInserting) {
      context.missing(_inputTextMeta);
    }
    if (data.containsKey('input_choice')) {
      context.handle(
          _inputChoiceMeta,
          inputChoice.isAcceptableOrUnknown(
              data['input_choice'], _inputChoiceMeta));
    } else if (isInserting) {
      context.missing(_inputChoiceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductListData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ProductListData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProductListTable createAlias(String alias) {
    return $ProductListTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ProductListTable _productList;
  $ProductListTable get productList => _productList ??= $ProductListTable(this);
  ProductListDao _productListDao;
  ProductListDao get productListDao =>
      _productListDao ??= ProductListDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productList];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ProductListDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProductListTable get productList => attachedDatabase.productList;
}
