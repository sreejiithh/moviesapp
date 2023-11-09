import 'package:flutter/material.dart';
import 'package:movies2/splashscreen/splashscreen.dart';
Map<String, WidgetBuilder>routes={
  Splashscreen.routeName:(context)=>Splashscreen(),
  Loginpage.routeName:(context)=>Loginpage(),
};

Image.asset(
"lib/images/flix.jpg",
fit: BoxFit.cover,
height: 40,
filterQuality: FilterQuality.high,
))),