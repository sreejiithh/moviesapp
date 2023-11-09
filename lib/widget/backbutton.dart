import 'package:flutter/material.dart';
import 'colors.dart';

class Backbtn extends StatelessWidget {
  const Backbtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 70,
        margin: EdgeInsets.only(top: 16, left: 16),
        decoration: BoxDecoration(
          color: Colours.scaffoldBgcolor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_rounded)));
  }
}