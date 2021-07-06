import 'package:flutter/material.dart';
import 'package:raramart/widgets/product_card.dart';

import 'package:shimmer/shimmer.dart';

import 'package:raramart/models/product_model.dart';
import 'package:raramart/services/product_service.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';

import 'package:raramart/widgets/widgets.dart';

class RelatedProducts extends StatefulWidget {
  final String labelName;
  final List<int> productsIDs;

  const RelatedProducts({
    Key? key,
    required this.labelName,
    required this.productsIDs,
  }) : super(key: key);

  @override
  _RelatedProductsState createState() => _RelatedProductsState();
}

class _RelatedProductsState extends State<RelatedProducts> {
  ProductService productService = new ProductService();

  @override
  void initState() {
    productService = new ProductService();

    print(widget.productsIDs);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(text: "You may also like", onPressed: () {}),
          _productList(),
        ],
      ),
    );
  }

  Widget _productList() {
    return new FutureBuilder(
      future: productService.getProducts(
        productsIDs: this.widget.productsIDs,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> model) {
        switch (model.connectionState) {
          case ConnectionState.done:
            return _buildList(model.data);
          case ConnectionState.waiting:
            return Container(
              height: 170,
              width: double.infinity,
              child: Shimmer.fromColors(
                child: Container(child: _buildList(model.data)),
                baseColor: kWhite,
                highlightColor: kLightGrey,
              ),
            );
          default:
            return Container(
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

  Widget _buildList(List<Product>? productList) {
    return (productList == null)
        ? Container(
            child: Center(
              child: kText(
                text: "Please Check",
              ),
            ),
          )
        : Container(
            height: 170,
            child: ListView.separated(
              itemCount: productList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                dynamic product = productList[index];
                return ProductCard(product: product);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 0,
                );
              },
            ),
          );
  }
}
