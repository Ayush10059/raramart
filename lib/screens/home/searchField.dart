import 'package:flutter/material.dart';
import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: kTextField(
        context,
        onChanged: () {},
        onValidate: () {},
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search,
          color: kDarkGrey.withOpacity(0.5),
        ),
        borderRadius: 20.0,
      ),
    );
  }
}
