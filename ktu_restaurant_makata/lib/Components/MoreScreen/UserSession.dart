import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Core/Colors.dart';
import '../../Util/Utility.dart';

Container UserSession(BuildContext context) {
  return Container(
    height: 100,
    decoration: const BoxDecoration(
      color: LIGHT_RED,
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
            // color: IVORY,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              UtilityService().confirmationBox(
                context: context,
                title: 'Logout',
                message: "Are you sure you want to logout of the app?",
                yesButtonColor: Colors.teal,
                noButtonColor: Colors.redAccent,
                onYes: () => exit(1),
                onNo: () => Navigator.pop(context),
              );
            },
            child: ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  color: IVORY,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: const Icon(Icons.exit_to_app, size: 45),
              ),
              title: Text(
                "Log out ",
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
              subtitle: Text(
                "Clear the current user session",
                style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
