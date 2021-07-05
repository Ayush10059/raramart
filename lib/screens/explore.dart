import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:foodieho_customer/utils/helper.dart';
import 'package:foodieho_customer/utils/size_config.dart';
import 'package:foodieho_customer/utils/widgets.dart';

import 'package:foodieho_customer/screens/explore/explore_widgets.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Map<String, dynamic>> splashData = [
    {
      "key": 0,
      "title": "Fast Food",
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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: buildSearchBar(context)),
          SliverToBoxAdapter(
            child: Container(
              height: 30.0,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kText(
                    text: "Categories",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  kIconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.th,
                      size: 15,
                    ),
                    size: 20,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
            sliver: SliverGrid(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: 105,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return circularImageCard(category: splashData[0]);
                },
                childCount: 8,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 30.0,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: kText(
                text: "Recommended for you",
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverGrid(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 3.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return imageCard(
                    product: splashData[0],
                    size: 120,
                  );
                },
                childCount: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
