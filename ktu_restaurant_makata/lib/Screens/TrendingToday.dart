// ignore_for_file: file_names

import 'package:flutter/material.dart';
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
          child: Column(
            children: [
              addVertical(5),
              Column(
                children: [
                  TrendingCard("LOCAL"),
                  addVertical(15),
                  TrendingCard("SNACK"),
                  addVertical(15),
                  TrendingCard("LOCAL"),
                  addVertical(15),
                  TrendingCard("FOREIGN"),
                  addVertical(15),
                  TrendingCard("LOCAL"),
                  addVertical(15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
