import 'package:flutter/material.dart';
import 'package:raramart/models/product_model.dart';

class WishlistNotifier with ChangeNotifier {
  List<Product> _wishlistProducts = [];
  List<Product> get allProducts => _wishlistProducts;

  void setProduct({
    required Product product,
    required int quantity,
  }) {
    if (_wishlistProducts.isNotEmpty) {
      for (int i = 0; i < _wishlistProducts.length; i++) {
        if (_wishlistProducts[i].id == product.id) {
          break;
        } else {
          _wishlistProducts.add(product);
          break;
        }
      }
    } else {
      _wishlistProducts.add(product);
    }

    notifyListeners();
  }

  void removeSingleProduct(int index) {
    _wishlistProducts.removeAt(index);
    notifyListeners();
  }

  void removeAllProducts() {
    _wishlistProducts = [];
    notifyListeners();
  }
}
