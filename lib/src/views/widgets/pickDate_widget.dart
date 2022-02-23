import 'package:flutter/material.dart';

import '../../controllers/trip_controller.dart';

Future pickDateRange(BuildContext context, SearshController appState) async {
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

  Future pickDate(BuildContext context, SearshController appState) async {
    DateTime? newDateTime = await showDatePicker(
      context: context,
      initialDate: appState.start!.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (newDateTime == null) return;
    appState.start?.value = newDateTime;
  }
