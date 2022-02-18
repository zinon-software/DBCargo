import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/searsh_controller.dart';
import 'components/flight_airport.dart';
import 'components/flying_button_search.dart';
import 'components/flying_date.dart';
import 'components/flying_details.dart';
import 'components/sorting_details.dart';
import 'components/tabs.dart';

class HomeTripsView extends StatelessWidget {
  const HomeTripsView({Key? key}) : super(key: key);

  static const routeName = '/trips';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[400],
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        // backgroundColor: ThemeColors.green,
        // backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 160,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(45.0),
                bottomRight: Radius.circular(45.0),
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 16.0,
                  color: Color.fromRGBO(168, 177, 198, 0.5),
                  offset: Offset(9.0, 9.0),
                ),
                BoxShadow(
                  blurRadius: 16.0,
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  offset: Offset(-9.0, -9.0),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10.0),
              const Expanded(flex: 1, child: SortingDetails()),
              const SizedBox(height: 10.0),
              const MyTabs(),
              const SizedBox(height: 10.0),
              const FlightAirport(),
              const SizedBox(height: 10.0),
              FlyingDetails(),
              const SizedBox(height: 10.0),
              FlyingDate(),
              const Expanded(flex: 2, child: FlyingButtonSearch()),
            ],
          )
        ],
      ),
    );
  }
}
