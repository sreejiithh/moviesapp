import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies2/widget/loginpage.dart';

class Splashscreen extends StatelessWidget {
  static String routeName = "SplashScreen";

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushNamedAndRemoveUntil(context, Loginpage.routeName, (route) => false);
    }
    );

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Soften',
                  style:  TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontStyle: FontStyle.italic,
                      color: Colors.white
                  ),
                ),
                Text(
                  'Online',
                  style: GoogleFonts.pattaya(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ],
            ),
            Container(
              height: 300,
              width: 250,
              color: Colors.white,
              child: Image.asset("lib/images/flix.jpg"),
            )
          ],
        ),
      ),
    );
  }
}
