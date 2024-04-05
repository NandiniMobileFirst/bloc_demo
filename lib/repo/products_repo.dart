import 'package:bloc_demo/models/product/product.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductsRepo {
  final Dio _dio = Dio();

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get("https://fakestoreapi.com/products");

      if (response.statusCode == 200) {
        return buildProductListFromResponse(response.data);
      } else {
        throw DioError(
          requestOptions: response.requestOptions,
          response: response,
          error: "Failed to load products. Status code: ${response.statusCode}",
        );
      }
    } on DioError catch (e) {
     
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
     
      throw Exception("Failed to load products: $e");
    }
  }
  List<Product> buildProductListFromResponse(dynamic responseData) {
  List<Product> productList = [];
  for (var item in responseData) {
    productList.add(Product.fromJson(item));
  }
  return productList;
}

}
