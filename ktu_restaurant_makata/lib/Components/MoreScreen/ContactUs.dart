// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Components/MoreScreen/FAQs.dart';

import '../../Core/Colors.dart';
import '../../Screens/FAQsScreen.dart';

Container ContactInfo(BuildContext context) {
  return Container(
    height: 270,
    decoration: const BoxDecoration(
      color: EMPHASIS_COLOR,
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: const BoxDecoration(
            color: EMPHASIS_COLOR,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: ListTile(
            leading: Container(
              decoration: const BoxDecoration(
                color: IVORY,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: const Icon(Icons.call, size: 45),
            ),
            title: Text(
              "Call us on",
              style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
            subtitle: Text(
              "0200100007",
              style: GoogleFonts.raleway(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
        const Divider(color: IVORY, thickness: 0.5),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  color: IVORY,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: const Icon(Icons.email_outlined, size: 45),
              ),
              title: Text(
                "Send us an e-mail",
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
              subtitle: Text(
                "georonathan47@gmail.com",
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ),
        const Divider(color: IVORY, thickness: 0.5),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FAQsScreen(),
            ),
          ),
          child: FAQs(),
        ),
      ],
    ),
  );
}
