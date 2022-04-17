import 'package:dpcargo/src/views/utilities/themeColors.dart';
import 'package:dpcargo/src/views/widgets/switch_widget.dart';
import 'package:dpcargo/src/views/utilities/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../tickets/flight_tickets_view.dart';
import 'components/flight_airport.dart';
import 'components/flight_path.dart';
import 'components/flying_button_search.dart';
import 'components/flying_date.dart';
import 'components/flying_passenger.dart';
import 'components/flying_class.dart';

class HomeTripsView extends StatelessWidget {
  const HomeTripsView({Key? key}) : super(key: key);

  static const routeName = '/trips';

  @override
  Widget build(BuildContext context) {
    // final SearshController appState = Get.find();
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
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
                const Center(
                  child: FlightPath(), 
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
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0),
                      bottomLeft: isMobile(context)
                          ? const Radius.circular(0.0)
                          : const Radius.circular(25.0),
                      bottomRight: isMobile(context)
                          ? const Radius.circular(0.0)
                          : const Radius.circular(25.0),
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
                        const Passenger(),
                        const ClassCabina(),
                        const Nonstop(titel: "Nonstop flights first"),
                        const SizedBox(height: 15)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15),
        child: FlyingButtonSearch(
          titel: "Search Flights",
          onTap: () {
            Get.to(
              () => const FlightTickets(),
            );
          },
        ),
      ),
    );
  }
}
