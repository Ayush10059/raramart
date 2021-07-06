import 'package:flutter/material.dart';

import 'package:raramart/models/product_model.dart';
import 'package:raramart/services/config.dart';
import 'package:raramart/services/product_service.dart';

enum ProductStatus { INITIAL, LOADING, LOADED }

class ProductNotifier with ChangeNotifier {
  ProductService _productService = ProductService();

  void resetStream() {
    _productList = [];
    _failure = null;
  }

  ProductStatus _status = ProductStatus.INITIAL;
  ProductStatus get getStatus => _status;
  void setStatus(ProductStatus status) {
    _status = status;
    notifyListeners();
  }

  Failure? _failure;
  Failure? get getFailure => _failure;
  void _setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  List<Product> _productList = [];
  List<Product> get getAllproduct => _productList;
  void getProducts({
    int? pageNumber,
    int? pageSize,
    String? strSearch,
    String? tagName,
    String? categoryId,
    List<int>? productsIDs,
    String? sortBy,
    String? sortOrder = "asc",
  }) async {
    try {
      _productList = await _productService.getProducts(
        pageNumber: pageNumber,
        pageSize: pageSize,
        strSearch: strSearch,
        tagName: tagName,
        categoryId: categoryId,
        productsIDs: productsIDs,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );
    } on Failure catch (f) {
      _setFailure(f);
    }

    setStatus(ProductStatus.LOADED);
  }
}
