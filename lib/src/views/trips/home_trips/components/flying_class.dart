import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../controllers/trip_controller.dart';
import '../../../widgets/text_widget.dart';

class ClassCabina extends StatelessWidget {
  ClassCabina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearshController appState = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(text: "Class"),
        const SizedBox(height: 8),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (CabinaClassModel item in appState.cabinaClass)
                GestureDetector(
                  onTap: () {
                    final isSelected =
                        appState.selectedCabinaClass.value.ID == item.ID;
                    if (!isSelected) {
                      appState.updateCabinaClass(item);
                    }
                  },
                  child: Row(
                    children: [
                      FaIcon(
                        item.icon,
                        size: 20,
                        color: item.ID == appState.selectedCabinaClass.value.ID
                            ? Colors.black
                            : Colors.black26,
                      ),
                      textWidget(
                          text: item.name,
                          colors:
                              item.ID == appState.selectedCabinaClass.value.ID
                                  ? Colors.black
                                  : Colors.black26),
                      const SizedBox(width: 15),
                    ],
                  ),
                ),
              // const Icon(
              //   item.icon,

              //   color: Colors.black,
              // ),
              // textWidget(text: "Business", colors: Colors.black),
              // const SizedBox(width: 15),
              // const Icon(
              //   item.icon,
              //   color: Colors.black26,
              // ),
              // textWidget(text: "First", colors: Colors.black26),
            ],
          ),
        ),
      ],
    );
  }
}
