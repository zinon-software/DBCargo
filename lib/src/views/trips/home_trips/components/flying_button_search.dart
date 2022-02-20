import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/text_widget.dart';
import '../../tickets/flight_tickets_view.dart';

class FlyingButtonSearch extends StatelessWidget {
  const FlyingButtonSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: textWidget(text: "Search Flights", colors: Colors.white),
          ),
        ),
      ),
    );
  }
}
