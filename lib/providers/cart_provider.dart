import 'package:flutter/material.dart';
import 'package:raramart/models/product_model.dart';

class CartModel {
  Product product;
  int quantity;
  CartModel({
    required this.product,
    required this.quantity,
  });
}

class CartNotifier with ChangeNotifier {
  List<CartModel> _cartProducts = [];
  List<CartModel> get allProducts => _cartProducts;

  void setProduct({
    required Product product,
    required int quantity,
  }) {
    CartModel _cartModel = CartModel(
      product: Product(),
      quantity: 0,
    );

    if (_cartProducts.isNotEmpty) {
      for (int i = 0; i < _cartProducts.length; i++) {
        if (_cartProducts[i].product.id == product.id) {
          _cartProducts[i].quantity = quantity;
          break;
        } else {
          _cartModel.product = product;
          _cartModel.quantity = quantity;

          _cartProducts.add(_cartModel);
          break;
        }
      }
    } else {
      _cartModel.product = product;
      _cartModel.quantity = quantity;

      _cartProducts.add(_cartModel);
    }

    notifyListeners();
  }

  void removeSingleProduct(int index) {
    _cartProducts.removeAt(index);
    notifyListeners();
  }

  void removeAllProducts() {
    _cartProducts = [];
    notifyListeners();
  }
}
