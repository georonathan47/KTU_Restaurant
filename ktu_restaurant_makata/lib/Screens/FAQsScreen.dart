import 'package:flutter/material.dart';

import '../Components/AppBar.dart';
import '../Core/Colors.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({Key key}) : super(key: key);

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        false,
        'FAQs',
        IconButton(
          icon: const Icon(Icons.navigate_before, size: 40),
          color: BLACK_COLOR,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(),
    );
  }
}
