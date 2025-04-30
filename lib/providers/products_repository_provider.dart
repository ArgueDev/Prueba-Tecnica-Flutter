import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../datasources/products_datasource.dart';
import '../repositories/products_repository.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  return ProductsRepository(ProductsDatasource());
});
