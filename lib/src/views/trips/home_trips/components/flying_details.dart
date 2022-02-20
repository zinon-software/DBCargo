
import 'package:dpcargo/src/controllers/searsh_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/themeStyles.dart';
import '../../../widgets/dropDown.dart';

class FlyingDetails extends StatelessWidget {
  FlyingDetails({Key? key}) : super(key: key);

  final SearshController searshController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: MediaQuery.of(context).size.width - 82,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12.0),
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
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: FlatButton(
                onPressed: () => buildShowModalBottomSheet(context),
                child: buildTravelersView(),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Cabin class:', style: ThemeStyles.dropDownTextStyle),
                  const SizedBox(width: 10.0),
                  DropDown('First')
                ],
              ),
            ),
          ],
        ),
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
            searshController.getTravellers.toString(),
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
                        count: searshController.getAdult,
                        title: 'Adult',
                        add: () => searshController.addAdult(),
                        remove: () => searshController.removeAdult(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      buildQuantity(
                        count: searshController.getChild,
                        title: 'Child',
                        add: () => searshController.addChild(),
                        remove: () => searshController.removeChild(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      buildQuantity(
                        count: searshController.getInfant,
                        title: "Infant",
                        add: () => searshController.addInfant(),
                        remove: () => searshController.removeInfant(),
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
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 22);

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
                  child: const Text('—', style: style),
                  onPressed: remove,
                )
              else
                const SizedBox(
                  width: 20,
                ),
              Text(count.toString(), style: style),
              MaterialButton(
                minWidth: 60,
                child: const Text('+', style: style),
                onPressed: add,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
