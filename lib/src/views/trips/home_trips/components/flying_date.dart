
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/searsh_controller.dart';
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

  // Widget buildDateSelector(String title, DateTime dateTime) {
  //   int month = dateTime.month;
  //   final List MONTHS = [
  //     "Jan",
  //     "Feb",
  //     "Mar",
  //     "Apr",
  //     "May",
  //     "Jun",
  //     "Jul",
  //     "Aug",
  //     "Sep",
  //     "Oct",
  //     "Nov",
  //     "Dec"
  //   ];
  //   String mon = MONTHS[month - 1];
  //   return Column(
  //     children: <Widget>[
  //       Expanded(
  //         child: Text(
  //           title,
  //           style: GoogleFonts.overpass(fontSize: 12, color: Colors.black),
  //         ),
  //       ),
  //       Expanded(
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text(
  //               dateTime.day.toString().padLeft(2, '0'),
  //               style: GoogleFonts.overpass(fontSize: 35),
  //             ),
  //             const SizedBox(
  //               width: 8,
  //             ),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Text(
  //                   '$mon ${dateTime.year.toString()}',
  //                   style: GoogleFonts.overpass(fontSize: 10),
  //                 ),
  //                 Text(
  //                   DateFormat(DateFormat.WEEKDAY).format(dateTime),
  //                   style:
  //                       GoogleFonts.overpass(fontSize: 10, color: Colors.black),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

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
