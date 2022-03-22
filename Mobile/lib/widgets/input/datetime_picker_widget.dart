import 'dart:developer';

import 'package:booking_billiards_app/view_model/service/service_storage.dart';
import 'package:booking_billiards_app/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

class DatetimePickerWidget extends StatefulWidget {
  @override
  _DatetimePickerWidgetState createState() => _DatetimePickerWidgetState();
}

class _DatetimePickerWidgetState extends State<DatetimePickerWidget> {
  final SecureStorage secureStorage = SecureStorage();
  DateTime dateTime = DateTime.now();
  DateTime date = DateTime.now();

  String getText() {
    if (dateTime == null) {
      return 'Select DateTime';
    } else {
      return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'Choose Time Booking',
        text: getText(),
        onClicked: () => pickDateTime(context),
      );

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
    await secureStorage.writeSecureData("dateTime", dateTime.toString());
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return DateTime.now();
    date = newDate;
    return newDate;
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final newTime = date.day == DateTime.now().day
        ? await showCustomTimePicker(
            context: context,
            onFailValidation: (context) => print('Unavailable selection'),
            initialTime: TimeOfDay.now(),
            selectableTimePredicate: (time) =>
                time!.hour >= TimeOfDay.now().hour)
        : await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
    if (newTime == null) return TimeOfDay.now();

    return newTime;
  }
}
