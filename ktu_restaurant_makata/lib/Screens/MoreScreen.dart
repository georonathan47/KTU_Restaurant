import 'package:flutter/material.dart';
import 'package:ktu_restaurant_makata/Components/AppBar.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(false, "More", null),
      body: Container(
        decoration: const BoxDecoration(color: IVORY),
      ),
    );
  }
}
