import 'package:dio/dio.dart';

import 'package:raramart/models/category_model.dart';

class CategoryService {
  Future<List<Category>> getCategories({
    int? pageNumber,
    int? pageSize,
    String? strSearch,
    String? tagName,
    String? categoryId,
    String? sortBy,
    String? sortOrder = "asc",
  }) async {
    List<Category> data = [];

    try {
      String parameter = "";

      if (strSearch != null) {
        parameter += "&search=$strSearch";
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
        parameter += "&category=$categoryId ";
      }

      if (sortBy != null) {
        parameter += "&orderby=$sortBy";
      }

      if (sortOrder != null) {
        parameter += "&order=$sortOrder";
      }

      // String url = Config.url + Config.categoriesUrl;
      // print(getOAuthURL("GET", url));

      // var response = await Dio()
      //     .get(
      //       getOAuthURL("GET", url),
      //       options: new Options(
      //         headers: {
      //           HttpHeaders.contentTypeHeader: "application/json",
      //         },
      //       ),
      //     )
      //     .timeout(
      //       Duration(
      //         seconds: 15,
      //       ),
      //     );
      // if (response.statusCode == 200) {
      //   data = (response.data as List)
      //       .map(
      //         (i) => Category.fromJson(i),
      //       )
      //       .toList();
      // }
    } on DioError catch (e) {
      print(e.response);
      throw e;
    }
    return data;
  }
}
