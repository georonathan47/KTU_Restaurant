import 'package:flutter/material.dart';
import 'package:ktu_restaurant_makata/Components/AppBar.dart';
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
    );
  }
}
