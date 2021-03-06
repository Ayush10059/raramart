import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart' as crypto;

class Config {
  static String key = "ck_bc072dcc60ae302c79c957a979a2bd2458a4eea3";
  static String secret = "cs_540cb3be515498ce7e3014b5c5fffc0e9a404254";
  static String url = "https://store.raramart.com/wp-json/wc/v3/";
  static String tokenUrl =
      "https://store.raramart.com/wp-json/jwt-auth/v1/token";
  static String productUrl = "products";
  static String categoriesUrl = "products/categories";
  static String ordersUrl = "orders";
}

// error codes
// 0 : no connection
// 1 : timeout error
// 2 : response error

class Failure {
  int code;
  String message;
  Failure({
    required this.code,
    required this.message,
  });
}

/// This Generates a valid OAuth 1.0 URL
///
/// if [isHttps] is true we just return the URL with
/// [consumerKey] and [consumerSecret] as query parameters
String getOAuthURL(String requestMethod, String queryUrl) {
  String consumerKey = Config.key;
  String consumerSecret = Config.secret;

  String token = "";
  String url = queryUrl;
  bool containsQueryParams = url.contains("?");

  Random rand = Random();
  List<int> codeUnits = List.generate(10, (index) {
    return rand.nextInt(26) + 97;
  });

  /// Random string uniquely generated to identify each signed request
  String nonce = String.fromCharCodes(codeUnits);

  /// The timestamp allows the Service Provider to only keep nonce values for a limited time
  int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  String parameters = "oauth_consumer_key=" +
      consumerKey +
      "&oauth_nonce=" +
      nonce +
      "&oauth_signature_method=HMAC-SHA1&oauth_timestamp=" +
      timestamp.toString() +
      "&oauth_token=" +
      token +
      "&oauth_version=1.0&";

  if (containsQueryParams == true) {
    parameters = parameters + url.split("?")[1];
  } else {
    parameters = parameters.substring(0, parameters.length - 1);
  }

  Map<dynamic, dynamic> params = Uri.splitQueryString(parameters);
  Map<dynamic, dynamic> treeMap = new SplayTreeMap<dynamic, dynamic>();
  treeMap.addAll(params);

  String parameterString = "";

  for (var key in treeMap.keys) {
    parameterString = parameterString +
        Uri.encodeQueryComponent(key) +
        "=" +
        treeMap[key] +
        "&";
  }

  parameterString = parameterString.substring(0, parameterString.length - 1);

  String method = requestMethod;
  String baseString = method +
      "&" +
      Uri.encodeQueryComponent(
          containsQueryParams == true ? url.split("?")[0] : url) +
      "&" +
      Uri.encodeQueryComponent(parameterString);

  String signingKey = consumerSecret + "&" + token;
  crypto.Hmac hmacSha1 =
      crypto.Hmac(crypto.sha1, utf8.encode(signingKey)); // HMAC-SHA1

  /// The Signature is used by the server to verify the
  /// authenticity of the request and prevent unauthorized access.
  /// Here we use HMAC-SHA1 method.
  crypto.Digest signature = hmacSha1.convert(utf8.encode(baseString));

  String finalSignature = base64Encode(signature.bytes);

  String requestUrl = "";

  if (containsQueryParams == true) {
    requestUrl = url.split("?")[0] +
        "?" +
        parameterString +
        "&oauth_signature=" +
        Uri.encodeQueryComponent(finalSignature);
  } else {
    requestUrl = url +
        "?" +
        parameterString +
        "&oauth_signature=" +
        Uri.encodeQueryComponent(finalSignature);
  }

  return requestUrl;
}
