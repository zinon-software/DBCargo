import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../controllers/trip_controller.dart';
import '../../../../models/airport_model.dart';
import '../../../widgets/text_widget.dart';

class FlightAirport extends StatefulWidget {
  const FlightAirport({Key? key}) : super(key: key);

  @override
  _FlightAirportState createState() => _FlightAirportState();
}

class _FlightAirportState extends State<FlightAirport> {
  final SearshController appState = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.to(
            () => GetValueTextFilde(
              airportType: "departureAirport",
              searshController: appState,
            ),
          ),
          child: GetBuilder<SearshController>(
              builder: (searshController) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(text: "From", colors: Colors.black26),
                      textWidget(
                          text: searshController.getDepartureAirport.value.city,
                          size: 20),
                      textWidget(
                          text:
                              "(${searshController.getDepartureAirport.value.name})"),
                      line(
                        height: 1.0,
                        width: 70.0,
                      ),
                    ],
                  )),
        ),
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Color(0xFF64B5F6),
              borderRadius: BorderRadius.all(Radius.circular(14))),
          child: Obx(
            () => FaIcon(
              (appState.selectedCategory.value.categoryId == 0)
                  ? Icons.trending_flat
                  : Icons.swap_horiz,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        Flexible(
          child: GestureDetector(
            onTap: () => Get.to(
              () => GetValueTextFilde(
                airportType: "arrivalAirport",
                searshController: appState,
              ),
            ),
            child: GetBuilder<SearshController>(
              builder: (searshController) => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  textWidget(text: "To", colors: Colors.black26),
                  textWidget(
                      text: searshController.getArrivalAirport.value.city,
                      size: 20),
                  textWidget(
                      text: "(${searshController.getArrivalAirport.value.name})"),
                  line(
                    height: 1.0,
                    width: 70.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
