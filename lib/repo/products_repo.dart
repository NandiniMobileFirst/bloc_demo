import 'package:bloc_demo/models/product/product.dart';
import 'package:dio/dio.dart';

class ProductsRepo {
  final Dio _dio = Dio();

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get("https://fakestoreapi.com/products");
      
      if (response.statusCode == 200) {
        return buildProductListFromResponse(response.data);
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Failed to load products: $e");
    }
  }
}
