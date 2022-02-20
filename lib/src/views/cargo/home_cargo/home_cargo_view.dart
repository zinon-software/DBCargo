import 'package:dpcargo/src/models/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/searsh_controller.dart';
import '../../trips/home_trips/components/flight_airport.dart';
import '../../trips/home_trips/components/flying_date.dart';
import '../../trips/tickets/flight_tickets_view.dart';
import '../../utilities/themeColors.dart';
import '../../widgets/text_widget.dart';

class HomeCargoView extends StatelessWidget {
  const HomeCargoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearshController appState = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xFF64B5F6),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height - 450,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/world_maps.png'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 500,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (Category category in appState.categories)
                        GestureDetector(
                          child: textWidget(
                              text:
                                  appState.selectedCategory.value.categoryId ==
                                          category.categoryId
                                      ? category.name!.toUpperCase()
                                      : category.name,
                              colors:
                                  (appState.selectedCategory.value.categoryId ==
                                          category.categoryId)
                                      ? Colors.white
                                      : Colors.white60,
                              size:
                                  (appState.selectedCategory.value.categoryId ==
                                          category.categoryId)
                                      ? 20
                                      : null),
                          onTap: () {
                            final isSelected =
                                appState.selectedCategory.value.categoryId ==
                                    category.categoryId;
                            if (!isSelected) {
                              appState.updateCategory(category);
                            }
                          },
                        )
                    ],
                  ),
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
                          GestureDetector(
                            onTap: () => Get.to(
                              () => GetValueTextFilde(
                                airportType: "departureAirport",
                                searshController: appState,
                              ),
                            ),
                            child: Obx(
                              () => Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textWidget(
                                      text: "From", colors: Colors.black26),
                                  textWidget(
                                      text: appState
                                          .getDepartureAirport.value.city,
                                      size: 20),
                                  textWidget(
                                      text:
                                          "(${appState.getDepartureAirport.value.name})"),
                                  line(
                                    height: 1.0,
                                    width: 70.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Color(0xFF64B5F6),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14))),
                            child: Obx(
                              () => FaIcon(
                                (appState.selectedCategory.value.categoryId ==
                                        0)
                                    ? Icons.trending_flat
                                    : Icons.swap_horiz,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(
                              () => GetValueTextFilde(
                                airportType: "arrivalAirport",
                                searshController: appState,
                              ),
                            ),
                            child: Obx(
                              () => Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  textWidget(
                                      text: "To", colors: Colors.black26),
                                  textWidget(
                                      text:
                                          appState.getArrivalAirport.value.city,
                                      size: 20),
                                  textWidget(
                                      text:
                                          "(${appState.getArrivalAirport.value.name})"),
                                  line(
                                    height: 1.0,
                                    width: 70.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(text: "Depart"),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => appState.selectedCategory.value
                                            .categoryId !=
                                        0
                                    ? FlyingDate().pickDateRange(context)
                                    : FlyingDate().pickDate(context),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.date_range),
                                        Obx(
                                          () => textWidget(
                                              text:
                                                  "${appState.start!.value.year}/${appState.start!.value.month}/${appState.start!.value.day}"),
                                        ),
                                      ],
                                    ),
                                    line(
                                      height: 1.0,
                                      width: 70.0,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Obx(
                                    () => Row(
                                      children: [
                                        Icon(
                                          Icons.date_range,
                                          color: (appState.selectedCategory
                                                      .value.categoryId ==
                                                  0)
                                              ? Colors.black26
                                              : Colors.black,
                                        ),
                                        textWidget(
                                            text: (appState.selectedCategory
                                                        .value.categoryId ==
                                                    0)
                                                ? "Return"
                                                : "${appState.end!.value.year}/${appState.end!.value.month}/${appState.end!.value.day}",
                                            colors: (appState.selectedCategory
                                                        .value.categoryId ==
                                                    0)
                                                ? Colors.black26
                                                : Colors.black),
                                      ],
                                    ),
                                  ),
                                  line(
                                    height: 1.0,
                                    width: 70.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(text: "Passenger"),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.people,
                                color: Colors.black,
                              ),
                              textWidget(text: "  2", colors: Colors.black),
                              const SizedBox(width: 15),
                              const FaIcon(
                                FontAwesomeIcons.child,
                                size: 20,
                                color: Colors.black26,
                              ),
                              textWidget(text: " Kids", colors: Colors.black26),
                              const SizedBox(width: 15),
                              const FaIcon(
                                FontAwesomeIcons.baby,
                                size: 20,
                                color: Colors.black26,
                              ),
                              textWidget(
                                  text: "  Infant", colors: Colors.black26),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget(text: "Class"),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.chair,
                                size: 20,
                                color: Colors.black26,
                              ),
                              textWidget(
                                  text: "Economy", colors: Colors.black26),
                              const SizedBox(width: 15),
                              const Icon(
                                Icons.chair_alt,
                                color: Colors.black,
                              ),
                              textWidget(
                                  text: "Business", colors: Colors.black),
                              const SizedBox(width: 15),
                              const Icon(
                                Icons.chair,
                                color: Colors.black26,
                              ),
                              textWidget(text: "First", colors: Colors.black26),
                            ],
                          ),
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
                            activeTrackColor:
                                const Color.fromARGB(255, 221, 56, 15),
                            activeColor: Colors.white,
                          ),
                        ],
                      ),
                      Flexible(
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          elevation: 16,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const FlightTickets());
                            },
                            splashColor: Colors.yellow,
                            child: Container(
                              width: MediaQuery.of(context).size.width - 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 221, 56, 15),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
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
}
