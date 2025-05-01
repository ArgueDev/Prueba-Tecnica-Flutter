import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/products_response.dart';

class LocalProductsNotifier extends StateNotifier<List<ProductResponse>> {
  LocalProductsNotifier(): super([]);

  void agregarProducto(ProductResponse producto) {
    state = [...state, producto];
  }

  void actualizarProducto(ProductResponse actualizado) {
    state = state
      .map((p) => p.id == actualizado.id ? actualizado : p)
      .toList();
  }

  void eliminarProducto(int id) {
    state = state.where((p) => p.id != id).toList();
  }
}

final localProductsProvider = StateNotifierProvider<LocalProductsNotifier, List<ProductResponse>>(
  (ref) => LocalProductsNotifier(),
);
