import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Core/Colors.dart';

TextFormField buildTextFormField(
  String hint,
  label,
  TextEditingController controller,
  bool isEmail,
  bool isUser,
  bool confirm,
  Function onChanged,
) {
  return TextFormField(
    validator: (value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: BLACK_COLOR,
          fontWeight: FontWeight.bold,
        ),
      ),
      labelText: label,
      labelStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: BLACK_COLOR,
          fontWeight: FontWeight.bold,
        ),
      ),
      border: InputBorder.none,
      prefixIcon: isEmail
          ? const Icon(Icons.mail_outline_rounded)
          : isUser
              ? const Icon(Icons.person)
              : const Icon(Icons.lock),
      fillColor: EMPHASIS_COLOR,
      filled: true,
      focusColor: PURPLE,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Color(0x00008baa),
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Color(0x00008baa),
        ),
      ),
    ),
    keyboardType: TextInputType.emailAddress,

    // onChanged: onChanged,
    // onSaved: (input) => isEmail
    //     ? userMap['email'] = input
    //     : (isUser ? userMap['name'] = input : userMap['password'] = input),
    obscureText: !isEmail && !isUser ? true : false,
  );
}
