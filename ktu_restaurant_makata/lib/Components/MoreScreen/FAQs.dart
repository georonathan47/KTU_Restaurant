import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Core/Colors.dart';

Container FAQs() {
  return Container(
    height: 70,
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
    decoration: const BoxDecoration(
      color: BACKGROUND_COLOR,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'FAQs',
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            letterSpacing: 1.5,
          ),
        ),
        const Icon(Icons.navigate_next, size: 40),
      ],
    ),
  );
}
