
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/trip_controller.dart';
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
                                onTap: () => appState.selectedCategory.value
                                            .categoryId !=
                                        0
                                    ? pickDateRange(context)
                                    : pickDate(context),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.date_range),
                                        Obx(
                                          () => textWidget(
                                              text:
                                                  "${appState.start!.value.year}/${appState.start!.value.month}/${appState.start!.value.day}"),
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
                                          color: (appState.selectedCategory
                                                      .value.categoryId ==
                                                  0)
                                              ? Colors.black26
                                              : Colors.black,
                                        ),
                                        textWidget(
                                            text: (appState.selectedCategory
                                                        .value.categoryId ==
                                                    0)
                                                ? "Return"
                                                : "${appState.end!.value.year}/${appState.end!.value.month}/${appState.end!.value.day}",
                                            colors: (appState.selectedCategory
                                                        .value.categoryId ==
                                                    0)
                                                ? Colors.black26
                                                : Colors.black),
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
                      )
                      ;
  }

  Future pickDateRange(BuildContext context) async {
    DateTimeRange? newDateTimeRange = await showDateRangePicker(
      context: context,
      // initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (newDateTimeRange == null) return;
    appState.start?.value = newDateTimeRange.start;
    appState.end?.value = newDateTimeRange.end;
  }

  Future pickDate(BuildContext context) async {
    DateTime? newDateTime = await showDatePicker(
      context: context,
      initialDate: appState.start!.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (newDateTime == null) return;
    appState.start?.value = newDateTime;
  }
}
