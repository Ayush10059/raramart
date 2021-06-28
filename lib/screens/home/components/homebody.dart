import 'package:flutter/material.dart';
import 'package:raramart/screens/home/components/searchField.dart';

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
        ],
      ),
    );
  }
}
