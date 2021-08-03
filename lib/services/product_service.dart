import 'dart:io';

import 'package:dio/dio.dart';

import 'package:raramart/services/config.dart';

import 'package:raramart/models/product_model.dart';

class ProductService {
  Future<List<Product>> getProducts({
    int? pageNumber,
    int? pageSize,
    String? strSearch,
    String? tagName,
    String? categoryId,
    List<int>? productsIDs,
    String? sortBy,
    String? sortOrder = "asc",
  }) async {
    List<Product> data = [];

    try {
      String parameter = "";

      if (strSearch != null) {
        parameter += "?search=$strSearch";
      }

      if (pageSize != null) {
        parameter += "&per_page=$pageSize";
      }

      if (pageNumber != null) {
        parameter += "&page=$pageNumber";
      }

      if (tagName != null) {
        parameter += "&tag=$tagName";
      }

      if (categoryId != null) {
        parameter += "?category=$categoryId";
      }

      if (productsIDs != null) {
        parameter += "?include=${productsIDs.join(",").toString()}";
      }

      if (sortBy != null) {
        parameter += "&orderby=$sortBy";
      }

      if (sortBy != null) {
        parameter += "&order=$sortOrder";
      }
      String url = Config.url + Config.productUrl + parameter.toString();

      print(getOAuthURL("GET", url));
      var response = await Dio().get(
        getOAuthURL("GET", url),
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Product.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Failure(
          code: 1,
          message: "Connection Timeout Exception",
        );
      }
      if (e.type == DioErrorType.response) {
        throw Failure(
          code: e.response!.statusCode ?? 2,
          message: e.response!.statusMessage ?? "error",
        );
      }
      throw Failure(
        code: 0,
        message: "There was an error, please check your connection",
      );
    }

    return data;
  }
}
