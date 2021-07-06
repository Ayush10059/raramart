import 'package:flutter/material.dart';
import 'package:raramart/utils/size_config.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categoryicons = [
      {"icon": "assets/images/ICONS_Electronics.png", "text": "Electronics"},
      {
        "icon": "assets/images/ICONS_Home Appliances.png",
        "text": "Home Appliances",
      },
      {
        "icon": "assets/images/ICONS_Womens Fashion.png",
        "text": "Womens Fashion"
      },
      {
        "icon": "assets/images/ICONS_Beauty and healths.png",
        "text": "Beauty and Health"
      },
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              categoryicons.length,
              (index) => CategoryCard(
                icon: categoryicons[index]["icon"],
                text: categoryicons[index]["text"],
                press: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            height: getProportionateScreenWidth(60),
            width: getProportionateScreenWidth(60),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber[50],
                image: DecorationImage(
                  image: AssetImage(icon),
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}
