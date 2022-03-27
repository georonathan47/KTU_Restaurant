import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Core/Colors.dart';

Container UserAccount() {
  return Container(
    height: 150,
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
              child: const Icon(Icons.person, size: 45),
            ),
            title: Text(
              "Super Admin",
              style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
            subtitle: Text(
              "Account not registered...",
              style: GoogleFonts.raleway(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
        const Divider(color: IVORY, thickness: 0.5),
      ],
    ),
  );
}
