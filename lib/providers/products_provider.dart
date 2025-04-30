
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:prueba_tecnica/providers/products_repository_provider.dart';
import '../model/products_response.dart';


part 'products_provider.g.dart';

@riverpod
Future<List<ProductResponse>> products (Ref ref) {
  final products = ref.watch(productsRepositoryProvider);
  return products.getAllProducts();
}