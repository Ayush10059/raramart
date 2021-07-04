// import 'dart:io';

// import 'package:dio/dio.dart';

// import 'package:bizzsansar/config.dart';

// class CartService {
//   final String token;
//   CartService(this.token);

//   Future getCart() async {
//     var data;
//     try {
//       String url = Config.cartUrl +
//           "?consumer_key=${Config.key}&consumer_secret=${Config.secret}}";
//       var response = await Dio().get(
//         url,
//         options: new Options(
//           headers: {
//             HttpHeaders.contentTypeHeader: "application/json",
//             HttpHeaders.authorizationHeader: "Bearer $token",
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         data = response.data;
//       }
//     } on DioError catch (e) {
//       print(e.response);
//       throw e;
//     }
//     return data;
//   }

//   Future addToCart({
//     String itemId,
//     String quantity,
//   }) async {
//     Map<String, dynamic> body = {
//       'product_id': itemId,
//       'quantity': quantity,
//     };

//     var data;

//     try {
//       String url = "https://bizzsansar.com/wp-json/cocart/v1/add-item" +
//           "?consumer_key=${Config.key}&consumer_secret=${Config.secret}}";
//       var response = await Dio().post(
//         url,
//         data: body,
//         options: new Options(
//           headers: {
//             HttpHeaders.contentTypeHeader: "application/json",
//             HttpHeaders.authorizationHeader: "Bearer $token",
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         data = response.data;
//       }
//     } on DioError catch (e) {
//       print(e.response);
//       throw e;
//     }
//     return data;
//   }

//   Future updateItem({
//     String itemKey,
//     String quantity,
//   }) async {
//     Map<String, dynamic> body = {
//       'cart_item_key': itemKey,
//       'quantity': quantity,
//     };

//     var data;

//     try {
//       String url = "https://bizzsansar.com/wp-json/cocart/v1/item" +
//           "?consumer_key=${Config.key}&consumer_secret=${Config.secret}}";
//       var response = await Dio().post(
//         url,
//         data: body,
//         options: new Options(
//           headers: {
//             HttpHeaders.contentTypeHeader: "application/json",
//             HttpHeaders.authorizationHeader: "Bearer $token",
//           },
//         ),
//       );

//       print(response);

//       if (response.statusCode == 200) {
//         data = response.data;
//       }
//     } on DioError catch (e) {
//       print(e.response);
//       throw e;
//     }
//     return data;
//   }

//   Future deleteItem({
//     String cartKey,
//   }) async {
//     Map<String, dynamic> body = {
//       'cart_item_key': cartKey,
//     };

//     var data;

//     try {
//       String url = "https://bizzsansar.com/wp-json/cocart/v1/item" +
//           "?consumer_key=${Config.key}&consumer_secret=${Config.secret}}";
//       var response = await Dio().delete(
//         url,
//         data: body,
//         options: new Options(
//           headers: {
//             HttpHeaders.contentTypeHeader: "application/json",
//             HttpHeaders.authorizationHeader: "Bearer $token",
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         data = response.data;
//       }
//     } on DioError catch (e) {
//       print(e.response);
//       throw e;
//     }
//     return data;
//   }

//   Future total({
//     String cartKey,
//   }) async {
//     var data;

//     try {
//       String url = "https://bizzsansar.com/wp-json/cocart/v1/totals" +
//           "?consumer_key=${Config.key}&consumer_secret=${Config.secret}}";
//       var response = await Dio().get(
//         url,
//         options: new Options(
//           headers: {
//             HttpHeaders.contentTypeHeader: "application/json",
//             HttpHeaders.authorizationHeader: "Bearer $token",
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         data = response.data;
//       }
//     } on DioError catch (e) {
//       print(e.response);
//       throw e;
//     }
//     return data;
//   }

//   Future clearCart({
//     String cartKey,
//   }) async {
//     var data;

//     try {
//       String url = "https://bizzsansar.com/wp-json/cocart/v1/clear" +
//           "?consumer_key=${Config.key}&consumer_secret=${Config.secret}}";
//       var response = await Dio().post(
//         url,
//         options: new Options(
//           headers: {
//             HttpHeaders.contentTypeHeader: "application/json",
//             HttpHeaders.authorizationHeader: "Bearer $token",
//           },
//         ),
//       );

//       print(response);

//       if (response.statusCode == 200) {
//         data = response.data;
//       }
//     } on DioError catch (e) {
//       print(e.response);
//       throw e;
//     }
//     return data;
//   }
// }
