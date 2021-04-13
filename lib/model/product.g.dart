// GENERATED CODE - DO NOT MODIFY BY HAND

part of product;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Product> _$productSerializer = new _$ProductSerializer();

class _$ProductSerializer implements StructuredSerializer<Product> {
  @override
  final Iterable<Type> types = const [Product, _$Product];
  @override
  final String wireName = 'Product';

  @override
  Iterable<Object> serialize(Serializers serializers, Product object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'designCode',
      serializers.serialize(object.designCode,
          specifiedType: const FullType(String)),
    ];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.inputText;
    if (value != null) {
      result
        ..add('inputText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.inputChoice;
    if (value != null) {
      result
        ..add('inputChoice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Product deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'designCode':
          result.designCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'inputText':
          result.inputText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'inputChoice':
          result.inputChoice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Product extends Product {
  @override
  final int id;
  @override
  final String designCode;
  @override
  final String inputText;
  @override
  final String inputChoice;

  factory _$Product([void Function(ProductBuilder) updates]) =>
      (new ProductBuilder()..update(updates)).build();

  _$Product._({this.id, this.designCode, this.inputText, this.inputChoice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(designCode, 'Product', 'designCode');
  }

  @override
  Product rebuild(void Function(ProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductBuilder toBuilder() => new ProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Product &&
        id == other.id &&
        designCode == other.designCode &&
        inputText == other.inputText &&
        inputChoice == other.inputChoice;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), designCode.hashCode), inputText.hashCode),
        inputChoice.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Product')
          ..add('id', id)
          ..add('designCode', designCode)
          ..add('inputText', inputText)
          ..add('inputChoice', inputChoice))
        .toString();
  }
}

class ProductBuilder implements Builder<Product, ProductBuilder> {
  _$Product _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _designCode;
  String get designCode => _$this._designCode;
  set designCode(String designCode) => _$this._designCode = designCode;

  String _inputText;
  String get inputText => _$this._inputText;
  set inputText(String inputText) => _$this._inputText = inputText;

  String _inputChoice;
  String get inputChoice => _$this._inputChoice;
  set inputChoice(String inputChoice) => _$this._inputChoice = inputChoice;

  ProductBuilder() {
    Product._initializeBuilder(this);
  }

  ProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _designCode = $v.designCode;
      _inputText = $v.inputText;
      _inputChoice = $v.inputChoice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Product other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Product;
  }

  @override
  void update(void Function(ProductBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Product build() {
    final _$result = _$v ??
        new _$Product._(
            id: id,
            designCode: BuiltValueNullFieldError.checkNotNull(
                designCode, 'Product', 'designCode'),
            inputText: inputText,
            inputChoice: inputChoice);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
