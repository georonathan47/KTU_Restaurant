import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Components/AppBar.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Core/WidgetFunction.dart';

import '../Components/More/UserAccouunt.dart';

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
              const Divider(
                thickness: 0.35,
                color: Colors.black,
              ),
              UserAccount("GEORGE", "You account has not been validated yet!"),
            ],
          ),
        ),
      ),
    );
  }
}
