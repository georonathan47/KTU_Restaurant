import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Index.dart';
import 'package:ktu_restaurant_makata/Util/NetworkUtility.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/Loading.dart';
import '../Components/TextFieldComponent.dart';
import '../Core/WidgetFunction.dart';
import '../Services/Path.dart';

class LoginAndRegister extends StatefulWidget {
  final Function toggleView;
  const LoginAndRegister({Key key, this.toggleView}) : super(key: key);

  // get tokenId => AuthService();

  @override
  _LoginAndRegisterState createState() => _LoginAndRegisterState(toggleView);
}

class _LoginAndRegisterState extends State<LoginAndRegister> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // final MakataAPI _api = MakataAPI();

  bool loading = false;
  String error = "";
  bool isAPIcall = false;
  _LoginAndRegisterState(Function toggleView);
  Map<String, dynamic> userMap;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userMap;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Loading(
      child: uiBuild(context),
      isAsyncCall: isAPIcall,
      opacity: 0.75,
    );
  }

  Widget uiBuild(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return Scaffold(
      body: ClipRRect(child: Details(screenWidth)),
    );
  }

  Container Details(double screenWidth) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: ExactAssetImage('assets/images/logo.png', scale: 0.1),
          // ),
          ),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 1,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Expanded(
          //   child: Transform.scale(
          //     scale: 1.75,
          //     child: Image.asset(
          //       'assets/images/logo.png',
          //       colorBlendMode: BlendMode.lighten,
          //         color: Colors.black87,
          //     ),
          //   ),
          // ),
          ClipRRect(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formkey,
                  child: Theme(
                    data: ThemeData(
                      brightness: Brightness.light,
                      inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: BACKGROUND_COLOR,
                          fontSize: 16.0,
                        ),
                      ),
                      // textTheme: screenWidth < 500 ? smallScreen : largeScreen,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(
                            children: [
                              Transform.scale(
                                scale: 2,
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  height: 100,
                                ),
                              ),
                              // addVertical(15),
                              Text(
                                "Create a new account!",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: PURPLE,
                                    letterSpacing: 1.75,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        addVertical(size.height * 0.025),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              buildTextFormField(
                                "Enter Your Username",
                                "Username",
                                nameController,
                                false,
                                true,
                                false,
                                (value) {
                                  setState(() {
                                    value = nameController.text;
                                  });
                                },
                              ),
                              addVertical(size.height * 0.010),
                              buildTextFormField(
                                "Enter A valid Email address",
                                "Email",
                                emailController,
                                true,
                                false,
                                false,
                                (value) {
                                  setState(() {
                                    value = emailController.text;
                                  });
                                },
                              ),
                              addVertical(size.height * 0.010),
                              buildTextFormField(
                                'Enter password',
                                'Password',
                                passwordController,
                                false,
                                false,
                                false,
                                (value) {
                                  setState(() {
                                    value = passwordController.text;
                                  });
                                },
                              ),
                              addVertical(size.height * 0.010),
                              buildTextFormField(
                                'Confirm password',
                                'Confirm Password',
                                confirmPasswordController,
                                false,
                                false,
                                true,
                                (value) {
                                  setState(() {
                                    value = confirmPasswordController.text;
                                  });
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 20.0),
                              ),
                              addVertical(size.height * 0.010),
                              SizedBox(
                                height: size.height * 0.07,
                                width: size.width * 0.55,
                                // child: Expanded(
                                //! Register button
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: EMPHASIS_COLOR,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  child: Text(
                                    'Register',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        letterSpacing: 1.25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  onPressed: onButtonPressed,
                                ),
                                // ),
                              ),
                              addVertical(size.height * 0.015),
                              Text(
                                error,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: Colors.red[500],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onButtonPressed() async {
    // signIn();

    if (validateAndSave()) {
      setState(() {
        isAPIcall = true;
        var userMap = {
          "id": null,
          "name": nameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "confirm_password": confirmPasswordController.text,
          "role": false,
        };
      });
      // var authority = "ktu-restaurant.bkayphotosgh.com";
      var response = await NetworkUtility().postData(REGISTER_URL, userMap);
      if (response.statusCode == 200) {
        var boddy = jsonEncode(response.body);
        // SharedPreferences localStorage = await SharedPreferences.getInstance();
        // localStorage.setString('token', json.encode(boddy['token']));
        // localStorage.setString('name', json.encode(boddy['name']));

        setState(() {
          isAPIcall = false;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Index(),
            ),
          );
        });
      }
    }
  }

  bool validateAndSave() {
    final form = _formkey.currentState;
    if (form.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        form.save();
      }
      return true;
    } else {
      return false;
    }
  }
}
