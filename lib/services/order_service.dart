// import 'dart:io';
// import 'dart:convert';

// import 'package:dio/dio.dart';

// import 'package:crypto/crypto.dart';

// import 'package:bizzsansar/config.dart';
// import 'package:bizzsansar/models/checkout_model.dart';

// class OrderService {
//   Future<bool> createOrder({
//     String payment,
//     List<LineItem> lineItem,
//     Billing billing,
//   }) async {
//     var authToken = base64Encode(
//       utf8.encode(Config.key + ":" + Config.secret),
//     );

//     bool ret = false;

//     CheckoutModel data = CheckoutModel(
//       paymentMethod: payment.toString(),
//       billing: billing,
//       lineItems: lineItem,
//     );

//     try {
//       var response = await Dio().post(Config.url + Config.ordersUrl,
//           data: checkoutModelToJson(data),
//           options: new Options(headers: {
//             HttpHeaders.authorizationHeader: 'Basic $authToken',
//             HttpHeaders.contentTypeHeader: "application/json"
//           }));

//       if (response.statusCode == 200) {
//         return true;
//       }

//       print(response);
//     } on DioError catch (e) {
//       print(e);
//       print(e.message);
//       throw e;
//     }

//     return ret;
//   }

//   calculateSig(stringToSign, privateKey) {
//     //calculate the signature needed for authentication
//     //
//     //String signingKey = '${Uri.encodeComponent(SHARED_SECRET)}&';

//     var hmac = Hmac(sha1, privateKey.codeUnits);

//     return Uri.encodeComponent(
//         base64Encode(hmac.convert(stringToSign.codeUnits).bytes));

//     // print('hero');
//     // var hash = Hmac(sha1, privateKey);
//     // print(hash);
//     // var base64 = base64Encode(
//     //   utf8.encode(stringToSign),
//     // );
//     // return base64;
//   }

//   Future<bool> emi({
//     Billing billing,
//   }) async {
//     // var authToken = base64Encode(
//     //   utf8.encode("ck_0a270ec9ad8e4432e7b2ba2bc8a7e7c9f97684e4" +
//     //       ":" +
//     //       "cs_155dc5740407a1c830cead06f2a23138222d50c9"),
//     // );

//     var expiration = 360000;
//     var unixtime = DateTime.now().millisecondsSinceEpoch.toString();
//     var future_unixtime = unixtime + expiration.toString();
//     var publicKey = "c21315c76e";
//     var privateKey = "0a94a6c944a5c5a";
//     var method = "POST";
//     var route = "forms/1/submissions";

//     var stringToSign =
//         publicKey + ":" + method + ":" + route + ":" + future_unixtime;

//     var sig = calculateSig(stringToSign, privateKey);
//     var url = 'http://bizzsansar.com/gravityformsapi/' +
//         route +
//         '?api_key=' +
//         publicKey +
//         '&signature=' +
//         sig +
//         '&expires=' +
//         future_unixtime;

//     bool ret = false;

//     print(url);

//     CheckoutModel data = CheckoutModel(
//       billing: billing,
//     );

//     print("data");
//     print(data.billing.firstName);

//     // FormData formData = FormData.fromMap(data);

//     print(checkoutModelToJson(data));

//     // try {
//     //   var response = await Dio()
//     //       .post("https://bizzsansar.com/wp-json/gf/v2/forms/1/submissions",
//     //           data: checkoutModelToJson(data),
//     //           options: new Options(headers: {
//     //             HttpHeaders.authorizationHeader: 'Basic $authToken',
//     //             HttpHeaders.contentTypeHeader: "application/json"
//     //           }));

//     //   if (response.statusCode == 200) {
//     //     return true;
//     //   }

//     //   print(response);
//     // } on DioError catch (e) {
//     //   print(e);
//     //   print(e.message);
//     //   throw e;
//     // }

//     return ret;
//   }
// }
