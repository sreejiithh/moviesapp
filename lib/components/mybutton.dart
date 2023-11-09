import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {

  final Function()? onTap;

  Mybutton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 280,

        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            "Sign In",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}