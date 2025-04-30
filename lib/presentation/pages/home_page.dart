import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/presentation/widgets/card_product.dart';
import 'package:prueba_tecnica/presentation/widgets/card_publish.dart';
import '../../providers/products_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('FakeStore')
      ),
      body: products.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (products) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Grandes Ofertas',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                _Cards(),
                SizedBox(height: 20),
                Padding(
                  padding:  EdgeInsets.only(left: 10),
                  child:  Text(
                    'Productos',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                 SizedBox(height: 10),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics:  NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (_, index) {
                      final product = products[index];
                      return CardProduct(
                        title: product.title,
                        image: product.image,
                        precio: product.price.toStringAsFixed(2),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add)
      ),
    );
  }
}

class _Cards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CardPublish(
            title: 'MEGA SALE DURING THE 20% OFF',
            imageUrl: 'assets/images/mujer.png',
            color: Color(0xFF8205FE),
          ),
          CardPublish(
            title: 'MEGA SALE DURING THE 10% OFF',
            imageUrl: 'assets/images/perfume.png',
            color: Color(0xFF1383F1),
          ),
          CardPublish(
            title: 'MEGA SALE DURING THE 30% OFF',
            imageUrl: 'assets/images/zapatos.png',
            color: Color(0xFF2E6283),
          ),
        ],
      ),
    );
  }
}
