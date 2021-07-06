import 'package:flutter/material.dart';
import 'package:raramart/utils/size_config.dart';
import 'package:raramart/widgets/appbar.dart';

import 'package:shimmer/shimmer.dart';

import 'package:raramart/models/product_model.dart';
import 'package:raramart/services/product_service.dart';
import 'package:raramart/utils/constants.dart';

import 'package:raramart/utils/helper.dart';
import 'package:raramart/widgets/widgets.dart';

class MoreScreen extends StatefulWidget {
  final String labelName;
  final String categoryId;

  const MoreScreen({
    Key? key,
    required this.labelName,
    required this.categoryId,
  }) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  ProductService productService = ProductService();

  @override
  void initState() {
    productService = new ProductService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: kPadding,
              child: kText(
                text: widget.labelName,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            _productList(),
          ],
        ),
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
