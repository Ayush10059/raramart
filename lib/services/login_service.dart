// import 'dart:io';
// import 'dart:convert';

// import 'package:dio/dio.dart';

// import 'package:bizzsansar/config.dart';
// import 'package:bizzsansar/models/customer_model.dart';

// class CustomerService {
  // Future<bool> createCustomer(CustomerModel model) async {
  //   var authToken = base64Encode(
  //     utf8.encode(Config.key + ":" + Config.secret),
  //   );

//     bool ret = false;

//     try {
//       var response = await Dio().post(Config.url + Config.costomerUrl,
//           data: model.toJson(),
//           options: new Options(headers: {
//             HttpHeaders.authorizationHeader: 'Basic $authToken',
//             HttpHeaders.contentTypeHeader: "application/json"
//           }));

//       print(response);

//       if (response.statusCode == 201) {
//         ret = true;
//       }
//     } on DioError catch (e) {
//       if (e.response.statusCode == 404) {
//         ret = false;
//       } else {
//         ret = false;
//       }
//     }

//     return ret;
//   }

//   Future loginCustomer(String username, String password) async {
//     try {
//       var response = await Dio().post(Config.tokenUrl,
//           data: {
//             "username": username,
//             "password": password,
//           },
//           options: new Options(headers: {
//             HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
//           }));

//       if (response.statusCode == 200) {
//         return response.data;
//       } else
//         return null;
//     } on DioError catch (e) {
//       print(e.message);
//     }
//   }
// }
