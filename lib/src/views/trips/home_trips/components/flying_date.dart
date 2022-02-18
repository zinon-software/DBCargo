import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controllers/searsh_controller.dart';

class FlyingDate extends StatelessWidget {
  FlyingDate({Key? key}) : super(key: key);

  final SearshController appState = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        height: 100.0,
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
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  // color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  onPressed: () =>
                      appState.selectedCategory.value.categoryId != 0
                          ? pickDateRange(context)
                          : pickDate(context),
                  child: buildDateSelector("DEPARTURE", appState.start!.value),
                ),
              ),
              if (appState.selectedCategory.value.categoryId != 0)
                Expanded(
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    onPressed: () => pickDateRange(context),
                    child: buildDateSelector("RETURN", appState.end!.value),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDateSelector(String title, DateTime dateTime) {
    int month = dateTime.month;
    final List MONTHS = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    String mon = MONTHS[month - 1];
    return Column(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.overpass(fontSize: 12, color: Colors.black),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                dateTime.day.toString().padLeft(2, '0'),
                style: GoogleFonts.overpass(fontSize: 35),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$mon ${dateTime.year.toString()}',
                    style: GoogleFonts.overpass(fontSize: 10),
                  ),
                  Text(
                    DateFormat(DateFormat.WEEKDAY).format(dateTime),
                    style:
                        GoogleFonts.overpass(fontSize: 10, color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
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
