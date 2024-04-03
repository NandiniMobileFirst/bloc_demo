import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'rating.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    required int id,
     String? title,
    double? price,
    String? description,
    required String category,
    String? image,
    Rating? rating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

List<Product> buildProductListFromResponse(
  String response,
) {
  return (json.decode(response) as List<dynamic>)
    .map(
    (json) => Product.fromJson(json as Map<String, dynamic>),
    )
    .toList();
}