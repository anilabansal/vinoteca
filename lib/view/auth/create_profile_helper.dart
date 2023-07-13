import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/auth/create_profile_controller.dart';
import 'package:vinoteca_app/controller/profile/profile_controller.dart';

/// This class is for common progress indicator

class ShowPicker {
  static Future<void> showTimePicker(BuildContext context,
      DateTime? selectedDate, bool? isUpdateProfile) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(1990, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      if (isUpdateProfile!) {
        Get.find<ProfileController>().updateDateMonth(selectedDate);
        print(selectedDate);
      } else {
        Get.find<CreateProfileController>().updateDateMonth(selectedDate);
        print(selectedDate);
      }
    }
  }
}
