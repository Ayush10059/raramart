import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:raramart/models/product_model.dart';
import 'package:raramart/services/product_service.dart';
import 'package:raramart/utils/constants.dart';

import 'package:raramart/utils/helper.dart';
import 'package:raramart/widgets/product_card.dart';
import 'package:raramart/widgets/widgets.dart';

class ProductGrid extends StatefulWidget {
  final String labelName;
  final String categoryId;
  final Function onPressed;

  const ProductGrid({
    Key? key,
    required this.labelName,
    required this.categoryId,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid>
    with AutomaticKeepAliveClientMixin<ProductGrid> {
  @override
  bool get wantKeepAlive => true;

  ProductService productService = ProductService();

  @override
  void initState() {
    productService = new ProductService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(
            text: widget.labelName,
            onPressed: () {
              return widget.onPressed();
            },
          ),
          _productList(),
        ],
      ),
    );
  }

  Widget _productList() {
    return new FutureBuilder(
      future: productService.getProducts(
        categoryId: this.widget.categoryId,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> model) {
        switch (model.connectionState) {
          case ConnectionState.done:
            return buildGrid(model.data);
          case ConnectionState.waiting:
            return Container(
              height: 180,
              alignment: Alignment.centerLeft,
              child: Shimmer.fromColors(
                  child: buildGrid(model.data),
                  baseColor: kWhite,
                  highlightColor: kLightGrey),
            );
          default:
            return Container(
              height: 180,
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
