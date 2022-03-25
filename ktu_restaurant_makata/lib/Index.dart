import 'package:flutter/material.dart';

import 'Core/Colors.dart';
import 'Screens/DashboardScreen.dart';
import 'Screens/MoreScreen.dart';

class Index extends StatefulWidget {
  const Index({Key key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      backgroundColor: BACKGROUND_COLOR,
      body: navigator(_selectedIndex),
    );
  }

  Widget navigator(int index) {
    if (index == 0) {
      return const DashboardScreen();
      // } else if (index == 1) {
      //   return const ServicesScreen();
      // } else if (index == 2) {
      //   return const PaymentScreen(showButton: false);
      } else if (index == 3) {
        return const MoreScreen();
    } else {
      return null;
    }
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: BACKGROUND_COLOR,
      selectedItemColor: const Color(0xFF35589A),
      unselectedItemColor: Colors.black54,
      selectedFontSize: 10,
      unselectedFontSize: 9,
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard,
            size: 20,
          ),
          label: 'Dashboard',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(
        //     Icons.article_outlined,
        //     size: 20,
        //   ),
        //   label: 'Services',
        // ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart_outlined,
            size: 20,
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.category_outlined,
            size: 20,
          ),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.more_horiz_outlined,
            size: 20,
          ),
          label: 'MORE',
        ),
      ],
    );
  }
}
