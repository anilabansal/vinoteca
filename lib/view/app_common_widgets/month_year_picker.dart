

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:vinoteca_app/controller/auth/create_profile_controller.dart';
import 'package:vinoteca_app/controller/profile/profile_controller.dart';

/// This class is for common progress indicator

class ShowMonthYearPicker {
  static Future<void> showTimePicker(BuildContext context,
      DateTime? selectedDate, bool? isUpdateProfile) async {

    final picked = await showMonthYearPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2080),
    );
    if (picked != null && picked != selectedDate) {

      print("picked$picked");
    }
  }
}
