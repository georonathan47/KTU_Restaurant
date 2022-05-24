import 'package:flutter/material.dart';
import 'package:ktu_restaurant_makata/Index.dart';

import 'SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(     
      title: 'Flutter Demo',
      home: SplashScreen(),
      // home: const Index(),
      debugShowCheckedModeBanner: false,
    );
  }
}
