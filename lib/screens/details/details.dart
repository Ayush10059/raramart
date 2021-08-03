import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:raramart/providers/wishlist_provider.dart';

import 'package:share/share.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_html/flutter_html.dart';

import 'package:raramart/providers/cart_provider.dart';

import 'package:raramart/router.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';
import 'package:raramart/utils/storage.dart';
import 'package:raramart/utils/custom_stepper.dart';

import 'package:raramart/widgets/appbar.dart';

import 'package:raramart/models/product_model.dart';

import 'package:raramart/screens/details/related_products_widget.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final SecureStorage secureStorage = SecureStorage();

  final CarouselController _carouselController = CarouselController();

  int _quantity = 1;

  int _currentIndex = 0;

  double _rating = 0.00;

  bool _apiCallProcess = false;

  @override
  void initState() {
    super.initState();

    _quantity = 1;

    _currentIndex = 0;

    _rating = double.parse(widget.product.averageRating ?? "0.00");

    _apiCallProcess = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productImages(context),
            Padding(
              padding: kPadding,
              child: Row(
                children: [
                  kText(
                      text: "¥ ${widget.product.price}",
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      WishlistNotifier _wishlistNotifier =
                          Provider.of<WishlistNotifier>(context, listen: false);

                      _wishlistNotifier.setProduct(
                        product: widget.product,
                        quantity: _quantity,
                      );
                      showSnackBar(context, text: "Added to Wishlist");
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: kDarkGrey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Share.share("${widget.product.permalink}");
                    },
                    icon: Icon(
                      Icons.share,
                      color: kDarkGrey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: kPadding,
              child: kText(
                text: widget.product.name.toString(),
                fontSize: 16,
                maxLines: 3,
                overflow: TextOverflow.visible,
              ),
            ),
            Padding(
              padding: kPadding,
              child: StarRating(
                rating: _rating,
                onRatingChanged: (rating) {
                  // _rating = rating;
                },
              ),
            ),
            Padding(
              padding: kPadding,
              child: Divider(
                height: 2.0,
                thickness: 2.0,
              ),
            ),
            Padding(
              padding: kPadding,
              child: kText(
                text: "Select Quantity",
                fontSize: 16,
                textColor: kDarkGrey.withOpacity(0.6),
              ),
            ),
            Padding(
              padding: kPadding,
              child: CustomStepper(
                lowerLimit: 1,
                upperLimit: 20,
                stepValue: 1,
                value: this._quantity,
                onChanged: (value) {
                  this._quantity = value;
                },
              ),
            ),
            Description(
              description: widget.product.description ?? '',
              shortDescription: widget.product.shortDescription ?? '',
            ),
            RelatedProducts(
              labelName: "Related Products",
              productsIDs: widget.product.relatedIds ?? [],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: kPadding,
        color: kWhite,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            kIconButton(
              icon: Icons.home_outlined,
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(Navigator.defaultRouteName),
                );
              },
            ),
            VerticalDivider(
              thickness: 1.0,
              width: 1.0,
            ),
            kIconButton(
              icon: Icons.favorite_border_outlined,
              onPressed: () {
                WishlistNotifier _wishlistNotifier =
                    Provider.of<WishlistNotifier>(context, listen: false);

                _wishlistNotifier.setProduct(
                  product: widget.product,
                  quantity: _quantity,
                );
                showSnackBar(context, text: "Added to Wishlist");
              },
            ),
            kButton(
              height: 50,
              width: 100,
              text: "Buy Now",
              bgColor: kPrimaryColor,
              onPressed: () {
                showConfirmationDialog(
                  context,
                  "Do you want to buy $_quantity item(s)?",
                  null,
                  "Yes",
                  () {
                    CartNotifier _cartNotifier =
                        Provider.of<CartNotifier>(context, listen: false);

                    _cartNotifier.setProduct(
                      product: widget.product,
                      quantity: _quantity,
                    );
                    showSnackBar(context, text: "Added to Cart");
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  "No",
                  () => Navigator.pop(context),
                );
              },
            ),
            kButton(
              height: 50,
              width: 100,
              text: "Add to Cart",
              bgColor: kYellow,
              onPressed: () {
                showConfirmationDialog(
                  context,
                  "Do you want to add $_quantity item(s) to Cart?",
                  null,
                  "Yes",
                  () {
                    CartNotifier _cartNotifier =
                        Provider.of<CartNotifier>(context, listen: false);

                    _cartNotifier.setProduct(
                      product: widget.product,
                      quantity: _quantity,
                    );
                    showSnackBar(context, text: "Added to Cart");
                    Navigator.pop(context);
                  },
                  "No",
                  () => Navigator.pop(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _productImages(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: widget.product.images?.length ?? 0,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  decoration: kBoxDecoration(
                    borderRadius: 0.0,
                    image: DecorationImage(
                      image:
                          NetworkImage(widget.product.images?[index].src ?? ''),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 1,
                aspectRatio: 1.0,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  _carouselController.previousPage();
                },
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  _carouselController.nextPage();
                },
              ),
            ),
          ),
          // TODO: dots
          // Positioned.fill(
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Padding(
          //       padding: const EdgeInsets.all(20.0),
          //       child: Row(
          //         children: List.generate(
          //           3,
          //           (index) => buildDot(
          //             currentIndex: _currentIndex,
          //             index: index,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int currentIndex, required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: currentIndex == index ? 24 : 8,
      decoration: BoxDecoration(
        color: currentIndex == index ? kWhite : kLightGrey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({
    this.starCount = 5,
    this.rating = .0,
    required this.onRatingChanged,
    this.color = kYellow,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children:
            new List.generate(starCount, (index) => buildStar(context, index)));
  }
}

class Description extends StatefulWidget {
  final String description;
  final String shortDescription;

  const Description({
    Key? key,
    required this.description,
    required this.shortDescription,
  }) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  int _page = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();

    _pageController = new PageController(
      initialPage: _page,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPadding,
      decoration: kBoxDecoration(
        borderRadius: 0.0,
      ),
      width: double.infinity,
      child: Html(data: widget.description),
    );
  }
}
