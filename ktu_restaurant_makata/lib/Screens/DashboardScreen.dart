// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:ktu_restaurant_makata/Components/WidgetFunction.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Models/FoodModel.dart';
import 'package:ktu_restaurant_makata/Screens/TrendingToday.dart';
import 'package:ktu_restaurant_makata/Services/NetworkUtility.dart';
import 'package:ktu_restaurant_makata/Services/Path.dart';
import 'package:ktu_restaurant_makata/Util/Utility.dart';

import '../Components/AppBar.dart';
import '../Components/Dashboard/DashboardCard.dart';
import '../Components/Progrss.dart';
import 'Categories.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // fetchFoodData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(true, "Dashboard", null),
      body: Container(
        decoration: const BoxDecoration(
          color: IVORY,
        ),
        child: Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                addVertical(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending Today",
                      style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .75),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TrendingTodayScreen(),
                        ),
                      ),
                      child: Text(
                        "See All",
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          color: PURPLE,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    // padding: const EdgeInsets.only(right: 10),
                    child: Trending(),
                  ),
                ),
                addVertical(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .75,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoryScreen(),
                        ),
                      ),
                      child: Text(
                        "See All",
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          color: PURPLE,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  // padding: const EdgeInsets.only(right: 10),
                  child: Trending(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<ListView> fetchFoodData() async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return const ProgressDialog(displayMessage: 'Please wait...');
        },
      );
      Response response = await NetworkUtility().getData(FOOD_URL);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        FoodModel foodModel = FoodModel(
            id: data['id'],
            foodName: data['foodName'].toString(),
            description: data['description'].toString(),
            image: data['image'].toString(),
            price: data['price']);
        debugPrint('Food model from server: $foodModel');
        return Trends(
          foodModel.image,
          foodModel.foodName,
          foodModel.description,
          foodModel.price,
          null,
        );
      }
    } catch (err) {
      UtilityService().showMessage(
        message: "An unknown error has occured.\nPlease try again later...",
        icon: const Icon(Icons.cancel, color: LIGHT_RED),
      );
    }
  }

  ListView Trends(
    String image,
    String foodName,
    String description,
    double price,
    Function onPressed,
  ) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        try {} catch (e) {}
        return DashboardCardComponent(
          image,
          foodName,
          description,
          price,
          onPressed,
        );
      },
    );
  }

  Row Trending() {
    return Row(
      children: [
        DashboardCardComponent(
          'assets/images/logo.png',
          "Banku & Tilapia",
          "With Goundnut Soup and Chicken/Fish",
          15,
          null,
        ),
        addHorizontal(5),
        DashboardCardComponent(
          'assets/images/logo.png',
          "Banku & Tilapia",
          "With Goundnut Soup and Chicken/Fish",
          15,
          null,
        ),
        addHorizontal(5),
        DashboardCardComponent(
          'assets/images/logo.png',
          "Banku & Tilapia",
          "With Goundnut Soup and Chicken/Fish",
          15,
          null,
        ),
        addHorizontal(5),
        DashboardCardComponent(
          'assets/images/logo.png',
          "Banku & Tilapia",
          "With Goundnut Soup and Chicken/Fish",
          15,
          null,
        ),
        addHorizontal(5),
        DashboardCardComponent(
          'assets/images/logo.png',
          "Banku & Tilapia",
          "With Goundnut Soup and Chicken/Fish",
          15,
          null,
        ),
        addHorizontal(5),
      ],
    );
  }
}
