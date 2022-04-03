// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonComponent extends StatelessWidget {
  final String label;
  final Function onTap;
  final double circularBorder;
  final double verticalPadding;
  final Color backgroundColor;

  const ButtonComponent({
    Key key,
    @required this.label,
    @required this.onTap,
    this.circularBorder,
    this.backgroundColor,
    this.verticalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 10, horizontal: 10),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.black,
          borderRadius: BorderRadius.circular(circularBorder ?? 30),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

ElevatedButton elevatedButton(String title) {
  return ElevatedButton(
    onPressed: null,
    child: Text(
      title,
      style: GoogleFonts.raleway(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    style: ElevatedButton.styleFrom(
      primary: Colors.teal,
      elevation: 1,
    ),
  );
}
