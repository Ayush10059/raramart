import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:raramart/models/product_model.dart';
import 'package:raramart/services/product_service.dart';

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
      future: productService.getProducts(
        categoryId: this.widget.categoryId,
      ),
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
            return Container(
              height: 170,
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

  Widget _buildList(List<Product>? productList) {
    return (productList == null)
        ? kText(
            text: "Please Check your Internet Connection",
          )
        : GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.5,
              crossAxisCount: 3,
              crossAxisSpacing: 5.0,
            ),
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: productList[index],
              );
            },
          );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
