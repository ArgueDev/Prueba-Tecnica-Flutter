
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import '../model/products_response.dart';
import 'providers.dart';

part 'products_provider.g.dart';

@riverpod
Future<List<ProductResponse>> products (Ref ref) {
  final products = ref.watch(productsRepositoryProvider);
  return products.getAllProducts();
}

@riverpod
Future<ProductResponse> productById (Ref ref, int id) {
  final productID = ref.watch(productsRepositoryProvider);
  return productID.getProductById(id);
}