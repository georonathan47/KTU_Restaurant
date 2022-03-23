// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Components/WidgetFunction.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';

import '../Components/AppBar.dart';
import '../Components/Dashboard/DashboardCard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent("Dashboard"),
      body: Container(
        decoration: const BoxDecoration(
          color: IVORY,
        ),
        child: Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                addVertical(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending Today",
                      style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .75),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        "See All",
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          color: PURPLE,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    // padding: const EdgeInsets.only(right: 10),
                    child: Trending(),
                  ),
                ),
                addVertical(15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  // padding: const EdgeInsets.only(right: 10),
                  child: Trending(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row Trending() {
    return Row(
      children: [
        DashboardCardComponent(
          'assets/images/logo.png',
          "Banku & Tilapia",
          "With Goundnut Soup and Chicken/Fish",
          null,
        ),
        addHorizontal(5),
        DashboardCardComponent(
          'assets/images/logo.png',
          "Banku & Tilapia",
          "With Goundnut Soup and Chicken/Fish",
          null,
        ),
        addHorizontal(5),
        DashboardCardComponent(
          'assets/images/logo.png',
          "Banku & Tilapia",
          "With Goundnut Soup and Chicken/Fish",
          null,
        ),
        addHorizontal(5),
        DashboardCardComponent(
          'assets/images/logo.png',
          "Banku & Tilapia",
          "With Goundnut Soup and Chicken/Fish",
          null,
        ),
        addHorizontal(5),
        DashboardCardComponent(
          'assets/images/logo.png',
          "Banku & Tilapia",
          "With Goundnut Soup and Chicken/Fish",
          null,
        ),
        addHorizontal(5),
      ],
    );
  }
}
