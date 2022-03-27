import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/AppBar.dart';
import '../Components/MoreScreen/ContactUs.dart';
import '../Components/MoreScreen/UserAccountInfo.dart';
import '../Components/MoreScreen/UserSession.dart';
import '../Core/Colors.dart';
import '../Core/WidgetFunction.dart';

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
      body: Container(
        decoration: const BoxDecoration(color: IVORY),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "User Account Information",
                  style: GoogleFonts.raleway(fontSize: 16),
                ),
              ),
              const Divider(
                color: BLACK_COLOR,
                thickness: .45,
              ),
              UserAccount(),
              addVertical(25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Contact Information",
                  style: GoogleFonts.raleway(fontSize: 16),
                ),
              ),
              const Divider(
                color: BLACK_COLOR,
                thickness: .45,
              ),
              ContactInfo(context),
              addVertical(25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "User Session",
                  style: GoogleFonts.raleway(fontSize: 16),
                ),
              ),
              const Divider(
                color: BLACK_COLOR,
                thickness: .45,
              ),
              UserSession(context),
            ],
          ),
        ),
      ),
    );
  }
}
