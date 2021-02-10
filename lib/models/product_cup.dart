import 'package:flutter/foundation.dart';

enum ProductColor { WHITE, BLACK, BLUE }

class ProductCup {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  ProductColor productColor; // tamano del producto
  double productPrice; // precio del producto autocalculado
  final bool liked;

  ProductCup({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productColor,
    this.liked = false,
  }) {
    productPrice = 72;
  }
}
