import 'package:flutter/material.dart';
import 'package:raramart/models/product_model.dart';
import 'package:raramart/services/product_service.dart';
import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';
import 'package:raramart/widgets/product_grid.dart';
import 'package:raramart/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  ProductService _productService = ProductService();

  @override
  void initState() {
    _productService = new ProductService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: kPadding,
            child: kText(
              text: "Favourites",
              fontSize: 16,
              textColor: kPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          _productList(),
        ],
      ),
    );
  }

  Widget _productList() {
    return new FutureBuilder(
      future: _productService.getProducts(
        // TODO: change
        categoryId: '26',
      ),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> model) {
        switch (model.connectionState) {
          case ConnectionState.done:
            return buildGrid(model.data);
          case ConnectionState.waiting:
            return Container(
              alignment: Alignment.centerLeft,
              child: Shimmer.fromColors(
                child: buildGrid(model.data),
                baseColor: kWhite,
                highlightColor: kLightGrey,
              ),
            );
          default:
            return Container(
              alignment: Alignment.centerLeft,
              child: Center(
                child: kText(
                  text: "Please Check your Internet Connection",
                ),
              ),
            );
        }
      },
    );
  }
}
