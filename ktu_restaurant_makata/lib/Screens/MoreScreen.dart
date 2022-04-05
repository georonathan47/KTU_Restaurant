import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Components/AppBar.dart';
import 'package:ktu_restaurant_makata/Components/More/FAQs.dart';
import 'package:ktu_restaurant_makata/Components/More/UserSession.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Core/WidgetFunction.dart';
import 'package:ktu_restaurant_makata/Services/AuthService.dart';
import 'package:ktu_restaurant_makata/Util/Utility.dart';

import '../Components/More/UserAccouunt.dart';
import 'LoginAndRegister.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(false, "More", null),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          decoration: const BoxDecoration(color: IVORY),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addVertical(10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'User Account Information',
                  style: GoogleFonts.raleway(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(thickness: 0.35, color: Colors.black),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginAndRegister(),
                  ),
                ),
                child: UserAccount(
                  "Don't have an account?",
                  "Please register to enjoy amazing offers",
                ),
              ),
              addVertical(25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Contact Information',
                  style: GoogleFonts.raleway(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(thickness: 0.35, color: Colors.black),
              FAQs(context),
              addVertical(25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'User Account Session',
                  style: GoogleFonts.raleway(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(thickness: 0.35, color: Colors.black),
              GestureDetector(
                onTap: () => UtilityService().confirmationBox(
                  context: context,
                  title: "Logout",
                  message:
                      "Are you sure you want to logout?\nThis will clear your current user session.",
                  onYes: () async {
                    await AuthService.logout(context);
                  },
                  onNo: () => Navigator.pop(context),
                  yesButtonColor: Colors.teal,
                  noButtonColor: LIGHT_RED,
                ),
                child: UserSession(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
