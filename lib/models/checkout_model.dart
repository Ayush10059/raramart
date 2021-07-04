// import 'dart:convert';

// CheckoutModel checkoutModelFromJson(String str) =>
//     CheckoutModel.fromJson(json.decode(str));

// String checkoutModelToJson(CheckoutModel data) => json.encode(data.toJson());

// class CheckoutModel {
//   CheckoutModel({
//     this.paymentMethod,
//     this.billing,
//     this.lineItems,
//   });

//   String paymentMethod;
//   Billing billing;
//   List<LineItem> lineItems;

//   factory CheckoutModel.fromJson(Map<String, dynamic> json) => CheckoutModel(
//         paymentMethod: json["payment_method"],
//         billing: Billing.fromJson(json["billing"]),
//         lineItems: List<LineItem>.from(
//             json["line_items"].map((x) => LineItem.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "payment_method": paymentMethod,
//         "billing": billing.toJson(),
//         "line_items": List<dynamic>.from(lineItems.map((x) => x.toJson())),
//       };
// }

// class Billing {
//   Billing({
//     this.firstName,
//     this.lastName,
//     this.address1,
//     this.city,
//     this.state,
//     this.email,
//     this.phone,
//   });

//   String firstName;
//   String lastName;
//   String address1;
//   String city;
//   String state;
//   String email;
//   String phone;

//   factory Billing.fromJson(Map<String, dynamic> json) => Billing(
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         address1: json["address_1"],
//         city: json["city"],
//         state: json["state"],
//         email: json["email"],
//         phone: json["phone"],
//       );

//   Map<String, dynamic> toJson() => {
//         "first_name": firstName,
//         "last_name": lastName,
//         "address_1": address1,
//         "city": city,
//         "state": state,
//         "email": email,
//         "phone": phone,
//       };
// }

// class LineItem {
//   LineItem({
//     this.productId,
//     this.quantity,
//   });

//   int productId;
//   int quantity;

//   factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
//         productId: json["product_id"],
//         quantity: json["quantity"],
//       );

//   Map<String, dynamic> toJson() => {
//         "product_id": productId,
//         "quantity": quantity,
//       };
// }

// class Arguments {
//   String token;
//   String paymentMethod;
//   Billing model;
//   dynamic cart;
//   String price;
//   String categoryId;
//   String searchStr;

//   Arguments({
//     this.token,
//     this.paymentMethod,
//     this.model,
//     this.cart,
//     this.price,
//     this.categoryId,
//     this.searchStr,
//   });
// }
