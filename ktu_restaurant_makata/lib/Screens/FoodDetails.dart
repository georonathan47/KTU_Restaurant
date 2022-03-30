// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Core/WidgetFunction.dart';

import '../Components/AppBar.dart';

class FoodDetailScreen extends StatefulWidget {
  final String name, description, price, image;
  const FoodDetailScreen({
    Key key,
    @required this.name,
    @required this.price,
    @required this.image,
    this.description,
  }) : super(key: key);

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        false,
        widget.name,
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.navigate_before,
            color: BLACK_COLOR,
            size: 40,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: IVORY,
        ),
        // child: ,
      ),
    );
  }
}
