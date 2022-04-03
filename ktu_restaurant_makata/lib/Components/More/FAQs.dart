// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Core/WidgetFunction.dart';
import 'package:ktu_restaurant_makata/Screens/FAQsScreen.dart';

Container FAQs(BuildContext context) {
  return Container(
    height: 266,
    decoration: const BoxDecoration(
      color: EMPHASIS_COLOR,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    child: Column(
      children: [
        ListTile(
          leading: Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              color: IVORY,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: const Icon(Icons.call, size: 50),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Contact Us",
              style: GoogleFonts.raleway(
                fontSize: 20,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
                color: BLACK_COLOR,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "0200100007",
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: BLACK_COLOR,
                letterSpacing: .25,
              ),
            ),
          ),
        ),
        addVertical(10),
        ListTile(
          leading: Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              color: IVORY,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: const Icon(Icons.mail_outline_outlined, size: 50),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Via Email",
              style: GoogleFonts.raleway(
                fontSize: 20,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
                color: BLACK_COLOR,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "georonathan47@gmail.com",
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: BLACK_COLOR,
                letterSpacing: .25,
              ),
            ),
          ),
        ),
        addVertical(10),
        const Divider(
          color: IVORY,
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FAQsScreen(),
            ),
          ),
          child: Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: BACKGROUND_COLOR,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FAQs",
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                      color: BLACK_COLOR,
                    ),
                  ),
                  const Icon(Icons.navigate_next, size: 40),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
