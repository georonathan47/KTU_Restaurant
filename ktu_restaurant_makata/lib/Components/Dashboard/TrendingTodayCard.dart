// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Core/WidgetFunction.dart';

Container TrendingCard(String category) {
  return Container(
    height: 280,
    decoration: const BoxDecoration(color: Colors.transparent),
    child: Card(
      color: BACKGROUND_COLOR,
      elevation: .75,
      child: Stack(
        children: [
          Image.asset("assets/images/logo.png"),
          addVertical(15),
          Positioned(
            left: 275,
            right: 0,
            top: 0,
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: const BoxDecoration(
                  color: IVORY,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  category,
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.75,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
