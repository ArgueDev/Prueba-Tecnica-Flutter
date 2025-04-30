import 'package:dio/dio.dart';
import 'package:prueba_tecnica/model/products_response.dart';

class ProductsDatasource {
  final dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com'));

  Future<List<ProductResponse>> getAllProducts() async {
    try {
      final response = await dio.get('/products');
      final data = response.data;

      if (data is List) {
        return data.map((product) => ProductResponse.fromJson(product)).toList();
      } else {
        throw Exception('La respuesta no es una lista de productos');
      }

    } catch (e) {
      throw Exception('Error al obtener los productos: $e');
    }
  }
}