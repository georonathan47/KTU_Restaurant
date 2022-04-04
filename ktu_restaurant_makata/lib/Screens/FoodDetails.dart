// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Components/Dashboard/DashboardCard.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Core/WidgetFunction.dart';
import 'package:ktu_restaurant_makata/Models/CartModel.dart';

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
  final controller = ScrollController();
  bool loaded = true;
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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: IVORY,
          ),
          child: Body(context),
        ),
      ),
    );
  }

  Column Body(BuildContext context) {
    return Column(
      children: [
        addVertical(10),
        // ? Picture Container
        PictureContainer(),
        // ? Food Details
        FoodDetails(context),
        // ? Other Details
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          itemCount: 4,
          itemBuilder: (context, index) {
            return DashboardCardComponent(
              'assets/images/logo.png',
              widget.name,
              widget.description,
              double.parse(widget.price),
              () {},
            );
          },
        ),
      ],
    );
  }

  Padding FoodDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: EMPHASIS_COLOR,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Food Name",
                        style: GoogleFonts.raleway(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .75,
                        ),
                      ),
                    ),
                    addVertical(5),
                    Text(
                      widget.name,
                      style: GoogleFonts.raleway(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Description",
                        style: GoogleFonts.raleway(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .75,
                        ),
                      ),
                    ),
                    addVertical(5),
                    Text(
                      widget.description,
                      style: GoogleFonts.raleway(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        letterSpacing: .5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container PictureContainer() {
    // var index =
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: BACKGROUND_COLOR,
            ),
            child: Stack(
              children: [
                Image.asset('assets/images/logo.png'),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        color: IVORY,
                      ),
                      child: IconButton(
                      padding: const EdgeInsets.all(8),
                        // ? Fix the index
                        // onPressed: () => CartClass().addItem(0),
                        onPressed: () => null,
                        splashColor: GOLD,
                        color: GOLD,
                        icon: const Icon(
                          Icons.shopping_cart_checkout_outlined,
                          color: BLACK_COLOR,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: IVORY,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "GH¢ ${double.parse(widget.price).toStringAsFixed(2)}",
                    style: GoogleFonts.raleway(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
