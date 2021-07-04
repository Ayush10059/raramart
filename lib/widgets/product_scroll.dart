import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:raramart/models/product_model.dart';
import 'package:raramart/services/product_service.dart';

import 'package:raramart/utils/helper.dart';
import 'package:raramart/widgets/product_card.dart';
import 'package:raramart/widgets/widgets.dart';

class ProductScroll extends StatefulWidget {
  final String labelName;
  final String categoryId;
  final Function onPressed;

  const ProductScroll({
    Key? key,
    required this.labelName,
    required this.categoryId,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ProductScrollState createState() => _ProductScrollState();
}

class _ProductScrollState extends State<ProductScroll>
    with AutomaticKeepAliveClientMixin<ProductScroll> {
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
          header(
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
      future: productService.getProducts(categoryId: this.widget.categoryId),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> model) {
        switch (model.connectionState) {
          case ConnectionState.done:
            return _buildList(model.data);
          case ConnectionState.waiting:
            return Container(
              height: 170,
              alignment: Alignment.centerLeft,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          default:
            return kText(
              text: "Please Check your Internet Connection",
            );
        }
      },
    );
  }

  Widget _buildList(List<Product>? productList) {
    return (productList == null)
        ? kText(
            text: "Please Check your Internet Connection",
          )
        : Container(
            height: 170,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: productList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.5),
                  child: ProductCard(product: productList[index]),
                );
              },
            ),
          );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
