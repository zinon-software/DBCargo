import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/searsh_controller.dart';
import '../../../models/category.dart';
import '../../trips/home_trips/components/flying_button_search.dart';
import '../../trips/home_trips/components/flying_date.dart';
import '../../trips/home_trips/components/sorting_details.dart';
import '../../trips/home_trips/components/tabs.dart';
import '../../utilities/themeColors.dart';

class HomeCargoView extends StatelessWidget {
  const HomeCargoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Get.back();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 160,
            decoration: BoxDecoration(
                color: ThemeColors.green,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(45.0),
                    bottomRight: Radius.circular(45.0))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 10.0),
              SortingDetails(),
              SizedBox(height: 10.0),
              MyTabs(),
              Expanded(child: SizedBox(height: 10.0)),
              Text(
                "قيد الانشاء",
                style: TextStyle(color: Colors.orange),
              ),
              FlyingDate(),
              SizedBox(height: 15.0),
              FlyingButtonSearch(),
              SizedBox(height: 10.0),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTravelersView() {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "TRAVELLERS",
          style: GoogleFonts.overpass(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(width: 5.0),
        Text(
          "01",
          style: GoogleFonts.overpass(fontSize: 35),
        )
      ],
    );
  }
}



