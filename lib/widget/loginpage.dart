import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies2/widget/homescreen.dart';
import '../components/mybutton.dart';
import '../components/squaretile.dart';
import '../components/textfield.dart';

class Loginpage extends StatefulWidget {
  final Function()? onTap;

  Loginpage({super.key, this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void SignInUserIn() async {
// show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Homescreen(),));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      ShowErrorMessage(e.code);
    }
  }

  void ShowErrorMessage(String meassage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          shape: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: Text(
            meassage,
            style: GoogleFonts.aBeeZee(fontSize: 14, color: Colors.red),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Welcome back you've been missed!",
                      style: GoogleFonts.dmSerifDisplay(
                          color: Colors.black87, fontSize: 16),
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
                          Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Mybutton(
                      text: "SignIn",
                      onTap: SignInUserIn,
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
                            color: Colors.grey[400],
                          )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              "Or continue with",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
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
                        SqaurTile(imagePath: "lib/images/apple.png")
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
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
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
