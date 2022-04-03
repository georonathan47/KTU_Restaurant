import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Core/Colors.dart';

class UtilityService {
  void showMessage({String message, Icon icon, BuildContext context}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 3),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          position: FlashPosition.bottom,
          child: FlashBar(
            icon: icon,
            message: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  void showException({String message, Icon icon, BuildContext context}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 3),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: WARNING,
          position: FlashPosition.bottom,
          child: FlashBar(
            icon: icon,
            message: Text(
              message,
              style: GoogleFonts.raleway(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }

  //
  // void listBox({String title, String message, BuildContext context, Color color}) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Padding(
  //           padding: const EdgeInsets.all(12.0),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Container(
  //                 height: 600,
  //                 width: 400,
  //                 decoration: BoxDecoration(
  //                   color: Colors.blue,
  //                   borderRadius: BorderRadius.circular(10),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       offset: Offset(0.5, 0.5),
  //                       spreadRadius: 0.2,
  //                       blurRadius: 0.2,
  //                     ),
  //                   ],
  //                 ),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 10),
  //                       child: Container(
  //                         alignment: Alignment.center,
  //                         child: Text(
  //                           title,
  //                           style: GoogleFonts.lato(
  //                               fontSize: 16,
  //                               fontWeight: FontWeight.w700,
  //                               color: Colors.teal,
  //                               decoration: TextDecoration.none),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 30,
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.only(left: 15, right: 15),
  //                       child: Container(
  //                         //alignment: Alignment.center,
  //                         child: Center(
  //                           child: Text(
  //                             message,
  //                             style: GoogleFonts.lato(
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.w400,
  //                               color: Colors.black,
  //                               decoration: TextDecoration.none,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }
  //

  // void notificationMessageWithButton(
  //     {String title,
  //       String message,
  //       BuildContext context,
  //       Function proceed,
  //       Color color,
  //       buttonText,
  //       Color textColor,
  //       Color backgroundColor,
  //     }) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Container(
  //                 height: 220,
  //                 width: 400,
  //                 decoration: BoxDecoration(
  //                   color:backgroundColor!=null ? backgroundColor :Colors.blueAccent,
  //                   borderRadius: BorderRadius.circular(10),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       offset: Offset(0.5, 0.5),
  //                       spreadRadius: 0.2,
  //                       blurRadius: 0.2,
  //                     ),
  //                   ],
  //                 ),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 10),
  //                       child: Container(
  //                         alignment: Alignment.center,
  //                         child: Text(
  //                           title,
  //                           style: GoogleFonts.lato(
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.bold,
  //                               color: Colors.black,
  //                               decoration: TextDecoration.none),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 30,
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.only(left: 15),
  //                       child: Container(
  //                         //alignment: Alignment.center,
  //                         child: Center(
  //                           child: Text(
  //                             message,
  //                             style: GoogleFonts.lato(
  //                               fontSize: 15,
  //                               wordSpacing: 0.8,
  //                               fontWeight: FontWeight.w400,
  //                               color: textColor!= null ? textColor : Colors.black,
  //                               decoration: TextDecoration.none,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 15,
  //                     ),
  //                     GestureDetector(
  //                       onTap: proceed,
  //                       child: Container(
  //                         height: 40,
  //                         width: 184,
  //                         decoration: BoxDecoration(
  //                           color: color,
  //                           borderRadius: BorderRadius.circular(10),
  //                           boxShadow: [
  //                             BoxShadow(
  //                               offset: Offset(0.4, 0.5),
  //                               spreadRadius: 0.2,
  //                               blurRadius: 0.2,
  //                             )
  //                           ],
  //                         ),
  //                         child: Center(
  //                           child: Text(
  //                             buttonText,
  //                             style: TextStyle(
  //                                 decoration: TextDecoration.none,
  //                                 fontSize: 17,
  //                                 fontWeight: FontWeight.w400,
  //                                 color: Colors.white),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: 10,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }

  void notificationMessageWithButton({
    String title,
    String message,
    BuildContext context,
    Function proceed,
    Color color,
    buttonText,
    Color textColor,
    Color backgroundColor,
    String firstTitle,
    String secondTitle,
    String thirdTitle,
    String valuationNumber,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 420,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: backgroundColor ?? Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0.5, 0.5),
                        spreadRadius: 0.2,
                        blurRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            title,
                            style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Something",
                        style: GoogleFonts.raleway(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 48,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.only(left: 9, right: 7),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // set rounded corner radius
                        ),
                        child: Center(
                          child: TextField(
                            obscureText: false,
                            style: const TextStyle(color: Colors.black54),
                            // controller: customerNameController,
                            onChanged: (field) {
                              // customerName = field;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Colors.black87, width: 0.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.7),
                              ),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black54,
                              ),
                              labelText: "Enter valuation number",
                              labelStyle: const TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Center(
                          child: Text(
                            message,
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              wordSpacing: 0.8,
                              fontWeight: FontWeight.w400,
                              color: textColor ?? Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: proceed,
                        child: Container(
                          height: 43,
                          width: 140,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0.0, 0.0),
                                spreadRadius: 0.0,
                                blurRadius: 0.0,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              buttonText,
                              style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void confirmationBox({
    String title,
    String message,
    BuildContext context,
    Function onYes,
    Function onNo,
    Color yesButtonColor,
    Color noButtonColor,
    String buttonLabel,
    double buttonHeight,
    double buttonWidth,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 220,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0.5, 0.5),
                        spreadRadius: 0.2,
                        blurRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            title,
                            style: GoogleFonts.lato(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Center(
                          child: Text(
                            message,
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              wordSpacing: 1,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: onYes,
                            child: Container(
                              height: buttonHeight ?? 35,
                              width: buttonWidth ?? 64,
                              decoration: BoxDecoration(
                                color: yesButtonColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0.4, 0.5),
                                    spreadRadius: 0.2,
                                    blurRadius: 0.2,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  buttonLabel ?? 'Yes',
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: onNo,
                            child: Container(
                              height: 35,
                              width: 64,
                              decoration: BoxDecoration(
                                color: noButtonColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0.4, 0.5),
                                    spreadRadius: 0.2,
                                    blurRadius: 0.2,
                                  )
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void singleButtonConfirmation({
    String title,
    String message,
    BuildContext context,
    Function onYes,
    Color color,
    String buttonLabel,
    double buttonHeight,
    double buttonWidth,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 220,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0.5, 0.5),
                        spreadRadius: 0.2,
                        blurRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            title,
                            style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Center(
                          child: Text(
                            message,
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              wordSpacing: 1,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: onYes,
                          child: Container(
                            height: buttonHeight ?? 35,
                            width: buttonWidth ?? 64,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0.4, 0.5),
                                  spreadRadius: 0.2,
                                  blurRadius: 0.2,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                buttonLabel ?? 'Yes',
                                style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void messageContent({
    String title,
    String message,
    BuildContext context,
    Function onYes,
    Color color,
    String buttonLabel,
    double buttonHeight,
    double buttonWidth,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(
                        0.5,
                        0.5,
                      ),
                      spreadRadius: 0.2,
                      blurRadius: 0.2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Center(
                        child: Text(
                          message,
                          style: GoogleFonts.lato(
                            fontSize: 16.3,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
