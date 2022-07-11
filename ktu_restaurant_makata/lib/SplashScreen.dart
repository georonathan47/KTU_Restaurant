// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Index.dart';

import 'Core/WidgetFunction.dart';
import 'Screens/LoginAndRegister.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  bool proceed = false;

  @override
  void initState() {
    super.initState();
    initDB();

    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        proceed = true;
        // goToLogin();
        goToHome();
      }
    });
  }

  void initDB() async {
    try {
      // await dashboardDB.initialize();
      // await billDB.initialize();
    } catch (e) {
      debugPrint('init db error: $e');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  Future<void> goToHome() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        // builder: (context) => const LoginAndRegister(),
        builder: (context) => const Index(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: animation.value * 225,
            ),
            Center(  
              child: Column(
                children: [
                  Text(
                    "Powered By:",
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.25,
                        fontWeight: FontWeight.w200,
                        color: Colors.black87,
                        // color: Color(0xFF01B000),
                      ),
                    ),
                  ),
                  addVertical(1),
                  Center(
                    child: Text(
                      "K B I",
                      style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          letterSpacing: 1.25,
                          fontWeight: FontWeight.w200,
                          color: Colors.black87,
                          // color: Color(0xFF01B000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
