import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/searsh_controller.dart';
import '../../../../models/airport_model.dart';

class FlightAirport extends StatefulWidget {
  const FlightAirport({Key? key}) : super(key: key);

  @override
  _FlightAirportState createState() => _FlightAirportState();
}

class _FlightAirportState extends State<FlightAirport> {
  final SearshController searshController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width - 82,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12.0),
        // border: Border.all(
        //   color: Colors.white.withOpacity(1.0),
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            offset: const Offset(4, 4),
            blurRadius: 15.0,
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15.0,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              Get.to(
                () => GetValueTextFilde(
                  airportType: "departureAirport",
                  searshController: searshController,
                ),
              );
            },
            child: Container(
              width: 110,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Obx(
                () {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        searshController.getDepartureAirport.value.name,
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        searshController.getDepartureAirport.value.city,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Obx(
                ()=> Icon(
                (searshController.selectedCategory.value.categoryId == 0)
                    ? Icons.flight_takeoff
                    : Icons.flight_land_outlined,
                color: Colors.black),
          ),
          MaterialButton(
            onPressed: () {
              Get.to(
                () => GetValueTextFilde(
                  airportType: "arrivalAirport",
                  searshController: searshController,
                ),
              );
            },
            child: Container(
              width: 110,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Obx(
                () {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        searshController.getArrivalAirport.value.name,
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        searshController.getArrivalAirport.value.city,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GetValueTextFilde extends StatefulWidget {
  const GetValueTextFilde({
    Key? key,
    required this.searshController,
    this.airportType,
  }) : super(key: key);

  final SearshController searshController;
  final String? airportType;

  @override
  _GetValueTextFildeState createState() => _GetValueTextFildeState();
}

class _GetValueTextFildeState extends State<GetValueTextFilde> {
  late TextEditingController _textEditingController;
  List<AirportModel> airports = listAirports;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(50),
            child: TextField(
              // keyboardType: TextInputType.phone,
              autofocus: true,
              onChanged: onAirport,
              controller: _textEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                // contentPadding:
                //     kIsWeb ? const EdgeInsets.only(top: 10) : EdgeInsets.zero,
                prefixIconConstraints: const BoxConstraints(
                  minHeight: 36,
                  minWidth: 36,
                ),
                prefixIcon: const Icon(
                  Icons.person,
                ),
                hintText: "Enter the number of passengers",
                suffixIconConstraints: const BoxConstraints(
                  minHeight: 36,
                  minWidth: 36,
                ),
                suffixIcon: IconButton(
                  constraints: const BoxConstraints(
                    minHeight: 36,
                    minWidth: 36,
                  ),
                  splashRadius: 24,
                  icon: const Icon(
                    Icons.clear,
                  ),
                  onPressed: () {
                    _textEditingController.clear();
                    // widget.onChanged(_textEditingController.text);
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: airports.length,
              itemBuilder: (context, index) {
                final airport = airports[index];
                return ListTile(
                  title: Text("${airport.city}     ${airport.name}"),
                  onTap: () {
                    if (widget.airportType == "arrivalAirport") {
                      widget.searshController.setArrivalAirport(airport.obs);
                    } else {
                      widget.searshController.setDepartureAirport(airport.obs);
                    }
                    Get.back();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void onAirport(String query) {
    final suggestions = listAirports.where((airport) {
      final airportName = airport.name.toUpperCase();
      final input = query.toUpperCase();

      return airportName.contains(input);
    }).toList();

    setState(() => airports = suggestions);
  }
}
