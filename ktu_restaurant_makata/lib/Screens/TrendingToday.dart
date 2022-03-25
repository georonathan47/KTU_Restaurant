import 'package:flutter/material.dart';
import 'package:ktu_restaurant_makata/Components/AppBar.dart';
import 'package:ktu_restaurant_makata/Components/Dashboard/DashboardCard.dart';
import 'package:ktu_restaurant_makata/Components/WidgetFunction.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';

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
        "Trending Today",
        IconButton(
          icon: const Icon(Icons.navigate_before),
          color: BLACK_COLOR,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: IVORY,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left:11),
          child: Column(
            children: [
              addVertical(5),
              Container(
                child: Column(
                  children: [
                    DashboardCardComponent(
                      'assets/images/logo.png',
                      "Local",
                      "",
                      0,
                      null,
                    ),
                    addVertical(5),
                    DashboardCardComponent(
                      'assets/images/logo.png',
                      "Local",
                      "",
                      0,
                      null,
                    ),
                    addVertical(5),
                    DashboardCardComponent(
                      'assets/images/logo.png',
                      "Local",
                      "",
                      0,
                      null,
                    ),
                    addVertical(5),
                    DashboardCardComponent(
                      'assets/images/logo.png',
                      "Local",
                      "",
                      0,
                      null,
                    ),
                    addVertical(5),
                    DashboardCardComponent(
                      'assets/images/logo.png',
                      "Local",
                      "",
                      0,
                      null,
                    ),
                    addVertical(5),
                    DashboardCardComponent(
                      'assets/images/logo.png',
                      "Local",
                      "",
                      0,
                      null,
                    ),
                    addVertical(5),
                    DashboardCardComponent(
                      'assets/images/logo.png',
                      "Local",
                      "",
                      0,
                      null,
                    ),
                    addVertical(5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
