import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies2/widget/authpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCSdWKf-1gOjU6f3C9vpCPR3C2mP4tV8X8",
          appId: "1:163984989582:android:47f2ce3e950b56e6e8d8df",
          messagingSenderId: "163984989582",
          projectId: "movieapp-14566"));
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MOVIE FLIX",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white10,
        useMaterial3: true,
      ),
      home: Authpage(),
    );
  }
}
