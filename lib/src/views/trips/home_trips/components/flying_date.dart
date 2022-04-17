import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/trip_controller.dart';
import '../../../widgets/pickDate_widget.dart';
import '../../../widgets/text_widget.dart';

class FlyingDate extends StatelessWidget {
  FlyingDate({Key? key}) : super(key: key);

  final SearshController appState = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(text: "Depart"),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => appState.selectedCategory.value.categoryId != 0
                  ? pickDateRange(context, appState)
                  : pickDate(context, appState),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.date_range),
                      Obx(
                        () => textWidget(
                          text:
                              "${appState.start!.value.year}/${appState.start!.value.month}/${appState.start!.value.day}",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  line(
                    height: 1.0,
                    width: 70.0,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Obx(
                  () => Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: (appState.selectedCategory.value.categoryId == 0)
                            ? Colors.black26
                            : Colors.black,
                      ),
                      textWidget(
                        text: (appState.selectedCategory.value.categoryId == 0)
                            ? "Return"
                            : "${appState.end!.value.year}/${appState.end!.value.month}/${appState.end!.value.day}",
                        colors:
                            (appState.selectedCategory.value.categoryId == 0)
                                ? Colors.black26
                                : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                line(
                  height: 1.0,
                  width: 70.0,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
