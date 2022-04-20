// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

// final Transaction _transaction = Transaction();

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
          onRefresh: () => fetchOrders(),
          child: FutureBuilder(
            future: fetchOrders(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    var orderNumber = snapshot.data.data[index].orderNo;
                    var payment = snapshot.data.data[index].paymentType;
                    var transactions = snapshot.data.data[index].transaction;
                    var status = snapshot.data.data[index].status;
                    var orderDetails = snapshot.data.data[index].orderDetails;
                    // var name = snapshot.data.data[index].orderDetails.food;
                    return GestureDetector(
                      onTap: () async => await onPressed(
                        context,
                        orderNumber,
                        payment,
                        transactions,
                        status,
                        orderDetails,
                      ),
                      child: Card(
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
                              addVertical(15),
                              Text(snapshot.data.data[index].status),
                            ],
                          ),
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

  Future<dynamic> onPressed(
    BuildContext context,
    String orderNumber,
    String paymentType,
    Transaction transactions,
    String status,
    List<OrderDetail> orderDetails,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        var index;
        return Dialog(
          elevation: 1,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.475,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              children: [
                addVertical(7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ORDER DETAILS",
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .25,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'CLOSE',
                        style: GoogleFonts.raleway(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .25,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: BLACK25,
                ),
                // ! Order Number
                addVertical(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextString('Order Number:'),
                    TextString(orderNumber),
                  ],
                ),
                // ! Food Details
                addVertical(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextString('Payment Type:'),
                    TextString(paymentType.toUpperCase()),
                  ],
                ),
                addVertical(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextString('Status:'),
                    TextString(status.toUpperCase()),
                  ],
                ),
                addVertical(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // TextString('Transaction:'),
                    // TextString(transactions.status ?? '-'),
                    TextString('Food Name: '),
                    TextString(orderDetails.first.food.foodName),
                  ],
                ),
                addVertical(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextString('Cost of Food:'),
                    TextString(
                        'GH¢ ${double.parse(orderDetails.first.food.price.toString()).toStringAsFixed(2)}'),
                  ],
                ),
                addVertical(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextString('Quantity:'),
                    TextString(orderDetails.first.qty.toString()),
                  ],
                ),

                addVertical(15),
                const Divider(color: WARNING, thickness: 1),
                const Divider(color: WARNING, thickness: 1),
                addVertical(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextString('Total Cost:'),
                    TextString(
                        'GH¢ ${double.parse(orderDetails.first.totalAmt.toString()).toStringAsFixed(2)}'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Text TextString(String data) {
    return Text(
      data,
      style: GoogleFonts.raleway(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: .25,
      ),
    );
  }

  Future<Orders> fetchOrders() async {
    try {
      final response = await NetworkUtility().getData(ORDER_URL);
      debugPrint('Order response: ${response.body}');
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
