import 'package:flutter/material.dart';
import 'package:raramart/screens/home/components/searchField.dart';
import 'package:raramart/screens/home/components/sliderBanner.dart';
import 'package:raramart/utils/size_config.dart';
import 'package:raramart/models/products_model.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchField(),
          SizedBox(height: 20.0),
          SliderBanner(),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(18.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mobiles, iPads and Tablets',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'See More',
                    style: TextStyle(
                        color: Colors.orange[300],
                        fontSize: getProportionateScreenWidth(12)),
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            addAutomaticKeepAlives: false,
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              ...List.generate(
                demoProducts.length,
                (index) => ProductCard(
                  product: demoProducts[index],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(18.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Only for you',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'See More',
                    style: TextStyle(
                        color: Colors.orange[300],
                        fontSize: getProportionateScreenWidth(12)),
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            addAutomaticKeepAlives: false,
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              ...List.generate(
                demoProducts.length,
                (index) => ProductCard(
                  product: demoProducts[index],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: getProportionateScreenWidth(100),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red[200]!.withOpacity(0.1),
              ),
              child: Image.asset(product.images[0]),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Text(
              product.title,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Text(
              '¥${product.price}',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(12),
                  fontWeight: FontWeight.w600,
                  color: Colors.orange[300]),
            )
          ],
        ),
      ),
    );
  }
}
