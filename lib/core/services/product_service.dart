import 'package:practice_arch/core/services/app_services.dart';
import 'package:practice_arch/model/product.dart';

abstract class ProductService extends AppService {
  Stream<List<Product>> watchAllProducts();

  Future insertProduct(Product product);

  Future updateProduct(Product product);

  Future deleteProduct(Product product);
}
