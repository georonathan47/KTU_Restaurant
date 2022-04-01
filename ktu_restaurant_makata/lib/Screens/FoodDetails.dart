// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_restaurant_makata/Core/Colors.dart';
import 'package:ktu_restaurant_makata/Core/WidgetFunction.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          color: IVORY,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              addVertical(10),
              // ? Picture Container
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: BACKGROUND_COLOR,
                    ),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topRight,
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
              addVertical(10),
              // ? Other Details
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    // ! Food Name and Description
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
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
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
