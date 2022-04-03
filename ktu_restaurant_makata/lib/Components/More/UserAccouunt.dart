// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';

Container UserAccount(String title, String subtitle) {
  return Container(
    height: 120,
    decoration: const BoxDecoration(
      color: EMPHASIS_COLOR,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    child: ListTile(
      leading: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: IVORY,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: const Icon(Icons.person, size: 50),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          title,
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
          subtitle,
          style: GoogleFonts.raleway(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: BLACK_COLOR,
              letterSpacing: .25),
        ),
      ),
    ),
  );
}
