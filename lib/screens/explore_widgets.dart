// import 'package:flutter/material.dart';

// import 'package:foodieho_customer/utils/constants.dart';
// import 'package:foodieho_customer/utils/helper.dart';

// Widget buildSearchBar(context) {
//   return Container(
//     margin: kMargin,
//     height: 36,
//     decoration: kBoxDecoration(color: kLightGrey, borderRadius: 10.0),
//     child: TextField(
//       decoration: InputDecoration(
//         enabledBorder: InputBorder.none,
//         focusedBorder: InputBorder.none,
//         hintText: "Search",
//         prefixIcon: Icon(
//           Icons.search,
//           color: kDarkGrey,
//         ),
//       ),
//       // onChanged: (val) {
//       //   setState(() {
//       //     searchString = val;
//       //   });
//       // },
//     ),
//   );
// }

// Widget circularImageCard({
//   required category,
// }) {
//   return Column(
//     children: [
//       Container(
//         height: 80,
//         decoration: kBoxDecoration(
//           shape: BoxShape.circle,
//           image: DecorationImage(
//             image: AssetImage(category['image']),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       SizedBox(height: 5.0),
//       Container(
//         height: 20,
//         width: 80,
//         child: kText(
//           text: category['title'],
//           fontSize: 10,
//           fontWeight: FontWeight.w600,
//           textAlign: TextAlign.center,
//         ),
//       ),
//     ],
//   );
// }
