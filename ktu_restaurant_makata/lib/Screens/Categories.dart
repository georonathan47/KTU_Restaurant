import 'package:flutter/material.dart';

import '../Components/AppBar.dart';
import '../Core/Colors.dart';

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
          icon: const Icon(Icons.navigate_before, size: 40),
          color: BLACK_COLOR,
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
