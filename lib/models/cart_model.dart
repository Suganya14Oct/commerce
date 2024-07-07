import 'package:commerce/models/product_model.dart';

class CartModel {

  final Product product;
  final int quantity;

  CartModel({required this.product, this.quantity = 1});
}