import 'package:flutter/material.dart';
import 'package:raramart/models/product_model.dart';
import 'package:raramart/screens/home/searchField.dart';
import 'package:raramart/services/product_service.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';
import 'package:raramart/widgets/appbar.dart';
import 'package:raramart/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchString = "";

  ProductService _productService = ProductService();

  @override
  void initState() {
    _productService = new ProductService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDashboardAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: kPadding,
              child: kTextField(
                context,
                autofocus: true,
                onChanged: (value) => setState(() => searchString = value),
                onValidate: () {},
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  color: kDarkGrey.withOpacity(0.5),
                ),
                borderRadius: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              // height: AppTheme.fullHeight(context),
              // width: AppTheme.fullWidth(context),
              child: FutureBuilder(
                  future: _productService.getProducts(
                    strSearch: searchString,
                  ),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Product>> model) {
                    switch (model.connectionState) {
                      case ConnectionState.done:
                        return (model.hasError)
                            ? Center(child: Text("No Products"))
                            : (model.data?.length == 0)
                                ? Container(
                                    // height:
                                    // AppTheme.fullHeight(context) *
                                    //     0.4,
                                    child: Center(
                                      child: Text("No Products"),
                                    ),
                                  )
                                : buildGrid(model.data);
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
                          child: Text("What are you looking for?"),
                        );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
