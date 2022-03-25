import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressDialog extends StatelessWidget {
  final String displayMessage;

  const ProgressDialog({Key key, @required this.displayMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              displayMessage,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
