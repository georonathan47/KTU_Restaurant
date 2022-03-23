// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Core/Colors.dart';

 AppBar AppBarComponent(String title) {
    return AppBar(
      backgroundColor: BACKGROUND_COLOR,
      elevation: 0.6,
      title: Text(
        title,
        style: GoogleFonts.raleway(
          fontSize: 16,
          letterSpacing: 0.6,
          color: BLACK_COLOR,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Transform.scale(
            scale: 1.25,
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
      ],
    );
  }