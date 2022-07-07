import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var platform_icon = Icons.abc;
  var platformName = Platform.operatingSystem;
  IconData getSystem() {
    if (Platform.isAndroid) {
      return Icons.android;
    } else if (Platform.isIOS) {
      return Icons.apple;
    }
    return Icons.desktop_windows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // ignore: prefer_const_literals_to_create_immutables
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(getSystem(), size: 100),

          const SizedBox(height: 75),

          // greeting text
          Text(
            "Hello Again!",
            style: GoogleFonts.bebasNeue(fontSize: 52),
          ),
          const SizedBox(height: 10),
          const Text(
            "Welcome back, You've been missed!",
            style: TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 50),

          //email textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Email')),
              ),
            ),
          ),
          const SizedBox(height: 10),

          //password textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // sign in button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)),
              child: const Center(
                  child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
            ),
          ),
          const SizedBox(height: 25),

          //not a member? register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Not a member?'),
              SizedBox(width: 5),
              Text(
                'Register Now',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
