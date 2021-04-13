import 'package:practice_arch/core/services/product_service.dart';
import 'package:practice_arch/data/decide/shared.dart';
import 'package:practice_arch/data/moor_database.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class AppViewModel extends ChangeNotifier {

  AppDatabase _appDb = constructDb();
  ProductService _productService;

  void init() {
    _productService = _appDb.productListDao;
  }

  Stream<List<Product>> watchProducts() {
    return _productService.watchAllProducts();
  }

  Future<dynamic> deleteProduct(Product product) {
    return _productService.deleteProduct(product);
  }

  Future<dynamic> insertProduct(Product product) async {
    await _productService.insertProduct(product);
    notifyListeners();
  }

  Future<dynamic> updateProduct(Product product) async {
    await _productService.updateProduct(product);
    notifyListeners();
  }
}
