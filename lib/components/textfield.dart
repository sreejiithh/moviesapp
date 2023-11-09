import 'package:flutter/material.dart';

class Mytextfeild extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscuretext;

  Mytextfeild(
      {super.key,
        this.controller,
        required this.hintText,
        required this.obscuretext});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscuretext,
        decoration: InputDecoration(
            enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.black54,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])
        ),
      ),
    );
  }
}