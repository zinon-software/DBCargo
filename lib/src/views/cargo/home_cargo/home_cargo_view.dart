import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utilities/themeColors.dart';

class HomeCargoView extends StatelessWidget {
  const HomeCargoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: ThemeColors.green,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.chevron_left),
      //     onPressed: () {
      //       Get.back();
      //     },
      //   ),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.menu),
      //       onPressed: () {},
      //     )
      //   ],
      // ),
      backgroundColor: ThemeColors.green,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 450,
            width: MediaQuery.of(context).size.width,
            // color: Colors.green,
            child: Image.asset('assets/images/world_maps.png'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 500,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10),
                // color: Colors.green,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textWidget(
                        text: "Round Trip", colors: Colors.white, size: 20),
                    const SizedBox(
                      width: 20,
                    ),
                    textWidget(
                        text: "One-Way", colors: Colors.white60, size: 20),
                  ],
                ),
              ),
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textWidget(text: "From", colors: Colors.black26),
                              textWidget(text: "Sadny", size: 20),
                              textWidget(text: "(SYD)"),
                              line(
                                height: 1.0,
                                width: 70.0,
                              ),
                            ],
                          ),
                          const FaIcon(
                            FontAwesomeIcons.planeDeparture,
                            size: 20,
                            color: Color.fromARGB(255, 221, 56, 15),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              textWidget(text: "To", colors: Colors.black26),
                              textWidget(text: "Sadny", size: 20),
                              textWidget(text: "(SYD)"),
                              line(
                                height: 1.0,
                                width: 70.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      textWidget(text: "Depart"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.date_range),
                                  textWidget(text: "6/08/20"),
                                ],
                              ),
                              line(
                                height: 1.0,
                                width: 70.0,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    color: Colors.black26,
                                  ),
                                  textWidget(
                                      text: "Return", colors: Colors.black26),
                                ],
                              ),
                              line(
                                height: 1.0,
                                width: 70.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      textWidget(text: "Passenger & Luggage"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.people,
                            color: Colors.black,
                          ),
                          textWidget(text: "2", colors: Colors.black),
                          const SizedBox(width: 15),
                          const FaIcon(
                            FontAwesomeIcons.child,
                            size: 20,
                            color: Colors.black26,
                          ),
                          textWidget(text: "Kids", colors: Colors.black26),
                          const SizedBox(width: 15),
                          const FaIcon(
                            FontAwesomeIcons.weightHanging,
                            size: 20,
                            color: Colors.black26,
                          ),
                          textWidget(text: "Kgs", colors: Colors.black26),
                        ],
                      ),
                      textWidget(text: "Class"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.chair,
                            size: 20,
                            color: Colors.black26,
                          ),
                          textWidget(text: "Economy", colors: Colors.black26),
                          const SizedBox(width: 15),
                          const Icon(
                            Icons.chair,
                            color: Colors.black,
                          ),
                          textWidget(text: "Business", colors: Colors.black),
                          const SizedBox(width: 15),
                          const Icon(
                            Icons.chair_alt,
                            color: Colors.black26,
                          ),
                          textWidget(text: "First", colors: Colors.black26),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textWidget(
                            text: "Nonstop flights first",
                            colors: Colors.black,
                          ),
                          // bool isSwitched = true;

                          //this goes in as one of the children in our column
                          Switch(
                            // value: isSwitched,
                            value: true,
                            onChanged: (value) {
                              // setState(() {
                              //   isSwitched = value;
                              // });
                            },
                            activeTrackColor: const Color.fromARGB(255, 221, 56, 15),
                            activeColor: Colors.white,
                          ),
                        ],
                      ),
                      Flexible(
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          elevation: 16,
                          child: InkWell(
                            onTap: () {},
                            splashColor: Colors.yellow,
                            child: Container(
                              width: MediaQuery.of(context).size.width - 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 221, 56, 15),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8.0)),
                              ),
                              child: textWidget(
                                  text: "Search Flights", colors: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  textWidget({String? text, Color? colors, double? size}) => Text(
        text!,
        style: TextStyle(color: colors, fontSize: size),
      );

  line({height, width}) => Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      );
}
