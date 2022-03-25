import 'package:flutter/material.dart';
import 'package:ktu_restaurant_makata/Components/AppBar.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        false,
        "Categories",
        IconButton(
          icon: const Icon(Icons.navigate_before),
          color: BLACK_COLOR,
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
