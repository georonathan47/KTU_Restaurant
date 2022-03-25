// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';

Container DashboardCardComponent(
    String image, String title, description, double price, Function onTap) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    width: 350,
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        color: BACKGROUND_COLOR,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                  child: Stack(
                    children: [
                      Image.asset(image),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 55,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: IVORY,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "GH¢ ${double.parse('$price').toStringAsFixed(2)}",
                                  style: GoogleFonts.raleway(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    fit: StackFit.expand,
                  ),
                ),
                const Divider(
                  color: Colors.black87,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 15),
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
    ),
  );
}
