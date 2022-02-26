import 'package:dpcargo/src/controllers/trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/themeStyles.dart';
import '../../../widgets/dropDown.dart';
import '../../../widgets/text_widget.dart';

class Passenger extends StatelessWidget {
  Passenger({Key? key}) : super(key: key);

  final SearshController appState = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buildShowModalBottomSheet(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(text: "Passenger"),
          const SizedBox(height: 8),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.people,
                  color:
                      (appState.getAdult == 0) ? Colors.black26 : Colors.black,
                ),
                appState.getAdult == 0
                    ? textWidget(text: " Adult", colors: Colors.black26)
                    : textWidget(
                        text: "  ${appState.getAdult}", colors: Colors.black),
                const SizedBox(width: 15),
                FaIcon(
                  FontAwesomeIcons.child,
                  size: 20,
                  color:
                      (appState.getChild == 0) ? Colors.black26 : Colors.black,
                ),
                appState.getChild == 0
                    ? textWidget(text: " Kids", colors: Colors.black26)
                    : textWidget(
                        text: "  ${appState.getChild}", colors: Colors.black),
                const SizedBox(width: 15),
                FaIcon(
                  FontAwesomeIcons.baby,
                  size: 20,
                  color:
                      (appState.getInfant == 0) ? Colors.black26 : Colors.black,
                ),
                appState.getInfant == 0
                    ? textWidget(text: " Infant", colors: Colors.black26)
                    : textWidget(
                        text: "  ${appState.getInfant}", colors: Colors.black),
              ],
            ),
          ),
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
          style: GoogleFonts.overpass(fontSize: 14, color: Colors.black),
        ),
        const SizedBox(width: 5.0),
        Obx(
          () => Text(
            appState.getTravellers.toString(),
            style: GoogleFonts.overpass(fontSize: 35),
          ),
        )
      ],
    );
  }

  buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(150.0, 20.0, 150.0, 20.0),
                child: Container(
                  height: 8.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildQuantity(
                        count: appState.getAdult,
                        title: 'Adult',
                        add: () => appState.addAdult(),
                        remove: () => appState.removeAdult(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      buildQuantity(
                        count: appState.getChild,
                        title: 'Child',
                        add: () => appState.addChild(),
                        remove: () => appState.removeChild(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      buildQuantity(
                        count: appState.getInfant,
                        title: "Infant",
                        add: () => appState.addInfant(),
                        remove: () => appState.removeInfant(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildQuantity(
      {required String title,
      required int count,
      required VoidCallback add,
      required VoidCallback remove}) {
    const style = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            border: Border.all(color: Colors.black26),
          ),
          child: Row(
            children: [
              if (count >= 1)
                MaterialButton(
                  minWidth: 60,
                  child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color(0xFF64B5F6),
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      child: const Text('—', style: style)),
                  onPressed: remove,
                )
              else
                const SizedBox(
                  width: 20,
                ),
              Text(
                count.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black),
              ),
              MaterialButton(
                minWidth: 60,
                child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color(0xFF64B5F6),
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: const Text('+', style: style)),
                onPressed: add,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
