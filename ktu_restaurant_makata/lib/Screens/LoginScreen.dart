import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Components/AppBar.dart';
import 'package:ktu_restaurant_makata/Components/ButtonComponent.dart';
import 'package:ktu_restaurant_makata/Components/TextFieldComponent.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Core/WidgetFunction.dart';

class LoginAndRegister extends StatefulWidget {
  const LoginAndRegister({Key key}) : super(key: key);

  @override
  State<LoginAndRegister> createState() => _LoginAndRegisterState();
}

class _LoginAndRegisterState extends State<LoginAndRegister> {
  final GlobalKey _formKey = GlobalKey();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(true, "Register", null),
      // persistentFooterButtons: [],
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 120),
        decoration: const BoxDecoration(
          color: IVORY,
        ),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Create an account to enjoy amazing offers!",
                  style: GoogleFonts.raleway(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                addVertical(25),
                // buildTextFormField(
                //   "Enter phone number",
                //   "Phone Number",
                //   phoneController,
                //   false,
                //   null,
                //   const Icon(Icons.phone),
                // ),
                // addVertical(15),
                // buildTextFormField(
                //   phoneController,
                //   "Enter password",
                //   "Password",
                //   true,
                //   null,
                //   const Icon(Icons.password),
                // ),
                addVertical(15),
                // BuildTextFormField(
                //   phoneController,
                //   "Phone Number",
                //   "Enter phone number",
                //   false,
                //   null,
                //   const Icon(Icons.phone),
                // ),
                // addVertical(15),
                // BuildTextFormField(
                //   phoneController,
                //   "Phone Number",
                //   "Enter phone number",
                //   false,
                //   null,
                //   const Icon(Icons.phone),
                // ),
                addVertical(25),
                // const ButtonComponent(
                //   label: "Register",
                //   onTap: null,
                //   // backgroundColor: Colors.teal,
                // ),
                elevatedButton('Register'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
