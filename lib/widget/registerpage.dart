import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies2/components/mybutton.dart';
import 'package:movies2/components/squaretile.dart';
import 'package:movies2/components/textfield.dart';

class RegisterPage extends StatefulWidget {

  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmController = TextEditingController();

  void SignInUserIn(BuildContext context) async {
    showDialog(context: context, builder: (context){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ClipRRect(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  "Let's create an ccount for you",
                  style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black87, fontSize: 16),
                ),
                SizedBox(
                  height: 25,
                ),
                Mytextfeild(
                  hintText: "username",
                  obscuretext: false,
                  controller: usernameController,
                ),
                SizedBox(
                  height: 10,
                ),
                Mytextfeild(
                  hintText: "paswword",
                  obscuretext: true,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 10,
                ),
                Mytextfeild(
                  hintText: "Confirm PAssword",
                  obscuretext: true,
                  controller: confirmController,
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
                    onTap: (){
                      SignInUserIn(context);
                    }
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
                    SqaurTile(imagePath: "lib/images/apple.jpg")
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an accoutn!",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child:  Text(
                      "Login Now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
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