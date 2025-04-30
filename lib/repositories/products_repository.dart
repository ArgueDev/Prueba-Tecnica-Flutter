import 'package:prueba_tecnica/datasources/products_datasource.dart';
import 'package:prueba_tecnica/model/products_response.dart';

class ProductsRepository {
  final ProductsDatasource productsDatasource;

  ProductsRepository(this.productsDatasource);

  Future<List<ProductResponse>> getAllProducts() {
    return productsDatasource.getAllProducts();
  }
}