// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';

SizedBox DashboardCardComponent(String image, String title, description, Function onTap) {
  return SizedBox(
    width: 320,
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        color: BACKGROUND_COLOR,
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
          child: Column(
            children: [
              Image.asset(image),
              const Divider(
                color: Colors.black87,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .75,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 45.0),
                      child: Divider(
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      description,
                      style: GoogleFonts.raleway(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: .75,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
