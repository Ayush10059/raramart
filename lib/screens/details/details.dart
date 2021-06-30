import 'package:flutter/material.dart';

import 'package:share/share.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';
import 'package:raramart/utils/storage.dart';
import 'package:raramart/utils/progressHUD.dart';
import 'package:raramart/utils/custom_stepper.dart';

import 'package:raramart/widgets/appbar.dart';

class DetailsScreen extends StatefulWidget {
  final String product;
  final String price;

  const DetailsScreen({
    Key? key,
    required this.product,
    required this.price,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

List<Map<String, dynamic>> splashData = [
  {
    "key": 0,
    "title": "Best Deals",
    "text": "We help people conect with store around United State of America",
    "image": "assets/images/onboarding.jpg"
  },
  {
    "key": 1,
    "title": "Get rewards as you eat",
    "text": "We help people conect with store around United State of America",
    "image": "assets/images/onboarding.jpg"
  },
  {
    "key": 2,
    "title": "Share your reviews",
    "text": "We help people conect with store around United State of America",
    "image": "assets/images/onboarding.jpg"
  },
];

class _DetailsScreenState extends State<DetailsScreen> {
  final SecureStorage secureStorage = SecureStorage();

  final CarouselController _carouselController = CarouselController();

  int _quantity = 1;

  int _currentIndex = 0;

  double _rating = 0.0;

  bool _apiCallProcess = false;

  @override
  void initState() {
    super.initState();

    _quantity = 1;

    _currentIndex = 0;

    _rating = 0.0;

    _apiCallProcess = false;
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: _apiCallProcess,
      child: Scaffold(
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
                        text: widget.price,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: kDarkGrey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Share.share(
                            "https://bizzsansar.com/wp-json/wc/v3/products/{widget.product.id}");
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
                  text: widget.product,
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
                    _rating = rating;
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
              // productDetailsScroll(
              //   labelName: "You may also like",
              //   productList: splashData[0],
              // ),
            ],
          ),
        ),
        bottomSheet: Container(
          padding: kPadding,
          color: kWhite,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              kIconButton(
                icon: Icons.home_outlined,
                onPressed: () {},
              ),
              VerticalDivider(
                thickness: 1.0,
                width: 1.0,
              ),
              kIconButton(
                icon: Icons.favorite_border_outlined,
                onPressed: () {},
              ),
              kButton(
                height: 50,
                width: 100,
                text: "Buy Now",
                bgColor: kPrimaryColor,
                onPressed: () {},
              ),
              kButton(
                height: 50,
                width: 100,
                text: "Add to Cart",
                bgColor: kYellow,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productImages(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: 5,
              itemBuilder: (context, index, realIndex) {
                return Container(
                    // height: AppTheme.fullHeight(context) * 0.3,
                    // child: Image.network(
                    //   widget.product.images[index].src,
                    //   fit: BoxFit.cover,
                    // ),
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
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: List.generate(
                    3,
                    (index) => buildDot(
                      currentIndex: _currentIndex,
                      index: index,
                    ),
                  ),
                ),
              ),
            ),
          )
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
