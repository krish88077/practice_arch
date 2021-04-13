import 'package:moor/moor.dart';
import 'package:practice_arch/model/product.dart';

part 'moor_database.g.dart';

@UseMoor(tables: [ProductList], daos: [ProductListDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e)
      : super(e);
  @override
  int get schemaVersion => 1;
}

class ProductList extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get designCode => text().clientDefault(() => '')();

  TextColumn get inputText => text()();

  TextColumn get inputChoice => text()();

  @override
  String get tableName => 'products';
}

@UseDao(tables: [ProductList])
class ProductListDao extends DatabaseAccessor<AppDatabase>
    with _$ProductListDaoMixin {
  final AppDatabase db;

  ProductListDao(this.db) : super(db);

  Stream<List<Product>> watchAllProducts() =>
      select(productList).watch().map((event) {
        return event.map((e) {
          final daoAsJson = e.toJson();
          final jsonAsBV = Product.fromJson(daoAsJson);
          return jsonAsBV;
        }).toList();
      });

  Future insertProduct(Product product) async {
    final id = await into(productList)
        .insert(ProductListData.fromJson(product.toJson()));
    int _id = 1000000 + id;
    product = product.rebuild((b) => b
      ..id = id
      ..designCode = 'FFS_T${_id.toString().substring(1)}');
    await updateProduct(product);
    return product;
  }

  Future updateProduct(Product product) =>
      update(productList).replace(ProductListData.fromJson(product.toJson()));

  Future deleteProduct(Product product) =>
      delete(productList).delete(ProductListData.fromJson(product.toJson()));

  @override
  Future<void> dispose() async {}

  @override
  Future<void> init() async {}
}
