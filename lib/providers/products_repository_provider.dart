import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/datasources/products_datasource.dart';
import 'package:prueba_tecnica/repositories/products_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ProductsRepository productsRepository(Ref ref) {
  final product = ProductsDatasource();
  return ProductsRepository(product);
}