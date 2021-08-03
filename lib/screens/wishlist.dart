import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raramart/models/product_model.dart';
import 'package:raramart/providers/wishlist_provider.dart';
import 'package:raramart/services/product_service.dart';
import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';
import 'package:raramart/widgets/product_grid.dart';
import 'package:raramart/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  ProductService _productService = ProductService();

  @override
  void initState() {
    _productService = new ProductService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Consumer<WishlistNotifier>(
      builder: (context, wishlist, child) {
        if (wishlist.allProducts.length == 0) {
          return Container(
            child: Center(
              child: kText(
                text: "No items in Wishlist",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                textColor: kBlack.withOpacity(0.6),
                maxLines: 2,
              ),
            ),
          );
        } else {
          // calculateTotal(order.allProducts);
          return Container(
            child: buildGrid(wishlist.allProducts),
          );
        }
      },
    );
  }
}
