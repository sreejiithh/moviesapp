import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies2/widget/homescreen.dart';
import 'package:movies2/components/squaretile.dart';
import 'package:movies2/components/textfield.dart';

class Loginpage extends StatefulWidget {

  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void SignInUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);
      Snack("Success");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen(),));
    }on FirebaseAuthException catch (e){
      Snack("Please enter your email and password");
      print(e);
      print(e.code);
      if(e.code=="Invalid email"){
        Snack("Email not found");
      }else if(e.code=="Invalid"){
        print(e.code);
        Snack("Password");
      }
    }
  }

    Snack(data){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(data)));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: ClipRRect(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.lock,
                      size: 100,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Welcome back you've been missed!",
                      style: GoogleFonts.dmSerifDisplay(
                          color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Mytextfeild(
                      hintText: "username",
                      obscuretext: false,
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Mytextfeild(
                      hintText: "password",
                      obscuretext: true,
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));
                            },
                            child: Text(
                              "forgot password?",
                              style: TextStyle(
                                  color: Colors.white,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                SizedBox(
                  height: 50,
                  width: 320,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));
                    },
                    child: Text(
                      "Signin",
                      style: TextStyle(fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(Colors.white)),
                  ),
                ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              "Or continue with",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SqaurTile(
                          imagePath: "lib/images/google2.png",
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        SqaurTile(imagePath: "lib/images/apple.png",)
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member?",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));
                          },
                            child: Text(
                              "Register Now",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}