import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/providers.dart';

class ProductDetailsPage extends ConsumerWidget {
  final int id;
  const ProductDetailsPage(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final productosAPI = ref.watch(productsProvider);
    final productosLocales = ref.watch(localProductsProvider);

    final productoLocal = productosLocales.firstWhereOrNull((p) => p.id == id);
    final isLocal = productoLocal != null;

    if (isLocal) {
      final producto = productoLocal!;
      return Scaffold(
        appBar: AppBar(
          title: Text('Detalles del Producto'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.go('/home'),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.network(producto.image, height: 200)),
              SizedBox(height: 30),
              Text(
                producto.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '\$${producto.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 4),
                        Text(
                          producto.rating.rate.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Descripción',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(producto.description, style: TextStyle(fontSize: 16)),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => context.go('/edit-product/$id'),
                    icon: Icon(Icons.edit),
                    label: Text('Editar'),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      ref.read(localProductsProvider.notifier).eliminarProducto(id);
                      context.go('/home');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Producto eliminado')),
                      );
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                    label: Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    //* Presentacion de los productos desde la API
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Producto'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: productosAPI.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (lista) {
          final producto = lista.firstWhereOrNull((product) => product.id == id);
          if (producto == null) {
            return Center(child: Text('Producto no encontrado'));
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.network(producto.image, height: 200)),
                SizedBox(height: 30),
                Text(
                  producto.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '\$${producto.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          SizedBox(width: 4),
                          Text(
                            producto.rating.rate.toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Descripción',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(producto.description, style: TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}

extension FirstWhereOrNullExtension<E> on List<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (final e in this) {
      if (test(e)) return e;
    }
    return null;
  }
}
