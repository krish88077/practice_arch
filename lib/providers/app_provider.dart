import 'package:practice_arch/data/decide/shared.dart';
import 'package:practice_arch/data/moor_database.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class AppViewModel extends ChangeNotifier {

  AppDatabase app = constructDb();

  Stream<List<Product>> watchProducts() {
    return app.productListDao.watchAllProducts();
  }

  Future<dynamic> deleteProduct(Product product) {
    return app.productListDao.deleteProduct(product);
  }

  Future<dynamic> insertProduct(Product product) async {
    await app.productListDao.insertProduct(product);
    notifyListeners();
  }

  Future<dynamic> updateProduct(Product product) async {
    await app.productListDao.updateProduct(product);
    notifyListeners();
  }
}
