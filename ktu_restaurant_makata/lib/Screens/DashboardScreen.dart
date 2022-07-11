// ignore_for_file: non_constant_identifier_names, file_names, missing_return

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Core/WidgetFunction.dart';
import 'package:ktu_restaurant_makata/Models/FoodModel.dart';
import 'package:ktu_restaurant_makata/Screens/FoodDetails.dart';
// import 'package:ktu_restaurant_makata/Screens/TrendingToday.dart';
import 'package:ktu_restaurant_makata/Util/NetworkUtility.dart';
import 'package:ktu_restaurant_makata/Services/Path.dart';

import '../Components/AppBar.dart';
import '../Components/Dashboard/DashboardCard.dart';
import '../Util/Utility.dart';
// import 'Categories.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<Food> futureFood;
  List foodFromSnapshot = [];

  @override
  void initState() {
    super.initState();
    futureFood = fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(true, "Dashboard", null),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: IVORY,
        ),
        child: RefreshIndicator(
          onRefresh: () async => await fetchFoods(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                addVertical(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's Menu",
                      style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .75),
                    ),
                    // TextButton(
                    //   onPressed: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const TrendingTodayScreen(),
                    //     ),
                    //   ),
                    //   child: Text(
                    //     "See All",
                    //     style: GoogleFonts.raleway(
                    //       fontSize: 16,
                    //       color: PURPLE,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                addVertical(15),
                SizedBox(
                  height: 270,
                  child: FutureBuilder(
                    future: fetchFoods(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DoThis(snapshot);
                      } else if (snapshot.hasError) {
                        return Text('SNAPSHOT ERROR: ${snapshot.error}');
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Transform.scale(
                          child: const CircularProgressIndicator.adaptive(),
                          scale: 2,
                        );
                      }
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 35),
                        decoration: const BoxDecoration(
                          color: EMPHASIS_COLOR,
                        ),
                        child: Center(
                          child: Text(
                            'Unable to fetch data...\nPlease try again later!',
                            style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .75,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                addVertical(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Orders",
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .75,
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const CategoryScreen(),
                    //     ),
                    //   ),
                    //   child: Text(
                    //     "See All",
                    //     style: GoogleFonts.raleway(
                    //       fontSize: 16,
                    //       color: PURPLE,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                addVertical(15),
                SizedBox(
                  child: Scrollbar(
                    thickness: 5.5,
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Trending(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView DoThis(AsyncSnapshot<dynamic> snapshot) {
    return ListView.builder(
      // controller: scrollContriller,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(right: 15),
      itemCount: snapshot.data.dataa.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailScreen(
                    name: snapshot.data.dataa[index].foodName,
                    image: snapshot.data.dataa[index].image,
                    price: snapshot.data.dataa[index].price,
                    description: snapshot.data.dataa[index].description,
                  ),
                ),
              );
            },
            child: DashboardCardComponent(
              'assets/images/logo.png',
              snapshot.data.dataa[index].foodName,
              snapshot.data.dataa[index].description,
              double.parse(snapshot.data.dataa[index].price).toDouble(),
              null,
            ),
          ),
        );
      },
    );
  }

  Future<Food> fetchFoods() async {
    try {
      final response = await NetworkUtility().getData(FOOD_URL);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        return Food.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load foods');
      }
    } catch (err) {
      UtilityService().showException(
        context: context,
        icon: const Icon(Icons.error, color: Colors.white, size: 25),
        message: "Failed to load contents.\nPlease try again later.",
      );
    }
  }

  Future<Food> fetchFoodData() async {
    try {
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return const ProgressDialog(displayMessage: 'Please wait...');
      //   },
      // );
      Response response = await NetworkUtility().getData(FOOD_URL);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // var index;
        Food food = Food(
          dataa: [
            data['id'],
            data['foodName'],
            data['description'],
            data['image'],
            data['price'],
          ],
          message: data['message'],
          status: data['status'],
        );
        debugPrint('Food model from server: $food');
        return DashboardCardComponent(
          'Food.dataa[index].image' ?? '-',
          'Food.dataa[index].foodName' ?? '-',
          'Food.dataa[index].description' ?? '-',
          20,
          null,
        ) as Future<Food>;
      } else if (response.statusCode == 500) {
        throw Exception('Server error, unable to fetch food.');
      }
    } catch (err) {
      UtilityService().showMessage(
        context: context,
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
      itemCount: 2,
      itemBuilder: (context, index) {
        // try {} catch (e) {}
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
          "With Groundnut Soup and Chicken/Fish",
          17,
          null,
        ),
        addHorizontal(15),
        DashboardCardComponent(
          'assets/images/logo.png',
          "Jollof & Tilapia",
          "With Chicken/Fish & extra 'Shitɔ'",
          17,
          null,
        ),
        addHorizontal(15),
        DashboardCardComponent(
          'assets/images/logo.png',
          "Fufu & Tilapia",
          "With Groundnut Soup and Chicken/Fish",
          15,
          null,
        ),
        addHorizontal(15),
        DashboardCardComponent(
          'assets/images/logo.png',
          "Banku & Tilapia",
          "With Groundnut Soup and Chicken/Fish",
          15,
          null,
        ),
        addHorizontal(15),
        DashboardCardComponent(
          'assets/images/logo.png',
          "Banku & Tilapia",
          "With Groundnut Soup and Chicken/Fish",
          12,
          null,
        ),
        addHorizontal(15),
      ],
    );
  }
}
