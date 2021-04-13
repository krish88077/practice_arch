library product;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'product.g.dart';

abstract class Product implements Built<Product, ProductBuilder> {
  factory Product([void updates(ProductBuilder b)]) = _$Product;

  Product._();

  @nullable
  int get id;

  String get designCode;

  @nullable
  String get inputText;

  @nullable
  String get inputChoice;

  static void _initializeBuilder(ProductBuilder b) {
    b..designCode = '';
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Product.serializer, this)
        as Map<String, dynamic>;
  }

  static Product fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Product.serializer, json);
  }

  static Serializer<Product> get serializer => _$productSerializer;
}
