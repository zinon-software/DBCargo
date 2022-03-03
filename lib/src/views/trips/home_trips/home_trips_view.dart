import 'package:dpcargo/src/views/trips/home_trips/components/flight_nonstop.dart';
import 'package:dpcargo/src/views/utilities/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/trip_controller.dart';
import '../../../models/category.dart';
import '../../widgets/text_widget.dart';
import '../tickets/flight_tickets_view.dart';
import 'components/flight_airport.dart';
import 'components/flying_button_search.dart';
import 'components/flying_date.dart';
import 'components/flying_passenger.dart';
import 'components/flying_class.dart';

class HomeTripsView extends StatelessWidget {
  const HomeTripsView({Key? key}) : super(key: key);

  static const routeName = '/trips';

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
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 500,
                    width: isMobile(context)
                        ? MediaQuery.of(context).size.width
                        : 350,
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (Category category in appState.categories)
                            GestureDetector(
                              child: textWidget(
                                  text: appState.selectedCategory.value
                                              .categoryId ==
                                          category.categoryId
                                      ? category.name!.toUpperCase()
                                      : category.name,
                                  colors: (appState.selectedCategory.value
                                              .categoryId ==
                                          category.categoryId)
                                      ? Colors.white
                                      : Colors.white60,
                                  size: (appState.selectedCategory.value
                                              .categoryId ==
                                          category.categoryId)
                                      ? 20
                                      : null),
                              onTap: () {
                                final isSelected = appState
                                        .selectedCategory.value.categoryId ==
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
                ),
                Container(
                  height: isMobile(context)
                      ? 500
                      : MediaQuery.of(context).size.height - 300,
                  width: isMobile(context)
                      ? MediaQuery.of(context).size.width
                      : 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                      bottomLeft: isMobile(context)
                          ? Radius.circular(0.0)
                          : Radius.circular(25.0),
                      bottomRight: isMobile(context)
                          ? Radius.circular(0.0)
                          : Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FlightAirport(),
                        FlyingDate(),
                        Passenger(),
                        ClassCabina(),
                        const Nonstop(),
                        FlyingButtonSearch(
                          titel: "Search Flights",
                          onTap: () {
                            Get.to(() => const FlightTickets());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
