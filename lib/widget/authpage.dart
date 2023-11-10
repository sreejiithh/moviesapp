import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies2/widget/loginorregister.dart';
import 'loginpage.dart';
import 'package:movies2/widget/homescreen.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            // user is logged in
            return Homescreen();
          }
          // user is not logeed in
          else {
            return LoginorRegisterPage();
          }
        },
      ),
    );
  }
}