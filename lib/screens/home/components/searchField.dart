import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 350,
            height: 45,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF979797).withOpacity(0.5)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.all(10)),
            ),
          )
        ],
      ),
    );
  }
}
