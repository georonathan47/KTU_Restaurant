// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Components/AppBar.dart';
import 'package:ktu_restaurant_makata/Components/Dashboard/TrendingTodayCard.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Core/WidgetFunction.dart';

class TrendingTodayScreen extends StatefulWidget {
  const TrendingTodayScreen({Key key}) : super(key: key);

  @override
  State<TrendingTodayScreen> createState() => _TrendingTodayScreenState();
}

class _TrendingTodayScreenState extends State<TrendingTodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        false,
        "Today's Menu",
        IconButton(
          icon: const Icon(Icons.navigate_before, size: 40),
          color: BLACK_COLOR,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: IVORY,
        ),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                 Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: const BoxDecoration(color: EMPHASIS_COLOR),
                      child: Text(
                        "Objects in the MIRROR appear CLOSER than they appear!",
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          color: BLACK_COLOR,
                        ),
                      ),
                    ),
                    const Divider(thickness: .35, color: BLACK25),
                SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                  child: Column(
                    children: [
                      TrendingCard("LOCAL"),
                      addVertical(10),
                      TrendingCard("SNACK"),
                      addVertical(10),
                      TrendingCard("LOCAL"),
                      addVertical(10),
                      TrendingCard("FOREIGN"),
                      addVertical(10),
                      TrendingCard("LOCAL"),
                      addVertical(10),
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
}
