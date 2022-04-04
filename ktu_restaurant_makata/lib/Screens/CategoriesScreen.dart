// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:ktu_restaurant_makata/Components/AppBar.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var cart = FlutterCart();
    return Scaffold(
      appBar: AppBarComponent(false, "Cart", null),
      body: Container(
        decoration: const BoxDecoration(color: IVORY),
      ),
    );
  }
}
