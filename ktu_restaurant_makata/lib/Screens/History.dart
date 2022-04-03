// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:ktu_restaurant_makata/Components/AppBar.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Core/WidgetFunction.dart';
import 'package:ktu_restaurant_makata/Services/Path.dart';
import 'package:ktu_restaurant_makata/Util/NetworkUtility.dart';

import '../Models/Orders.dart';
import '../Util/Utility.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Future<Orders> futureOrders;
  @override
  void initState() {
    super.initState();
    setState(() {
      futureOrders = fetchOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(false, "History", null),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: const BoxDecoration(color: IVORY),
        child: RefreshIndicator(
          onRefresh: () => futureOrders,
          child: FutureBuilder(
            future: futureOrders,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: BACKGROUND_COLOR,
                      elevation: 1,
                      child: ListTile(
                        leading: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.history, size: 35),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order No:",
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .25,
                              ),
                            ),
                            Text(snapshot.data.data[index].orderNo),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            // Text(snapshot?.data?.data[index].),
                            addVertical(15),
                            Text(snapshot.data.data[index].status),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                      child: const Divider(),
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Transform.scale(
                    child: const CircularProgressIndicator.adaptive(),
                    scale: 2,
                  ),
                );
              }
              return const Card(
                elevation: 1.25,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Couldn't fetch data...\nPlease try again later!",
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<Orders> fetchOrders() async {
    try {
      final response = await NetworkUtility().getData(ORDER_URL);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        return Orders.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (err) {
      UtilityService().showException(
        context: context,
        icon: const Icon(Icons.error, color: Colors.white, size: 25),
        message: "Failed to load contents.\nPlease try again later.",
      );
    }
  }
}
