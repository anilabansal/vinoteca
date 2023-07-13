

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/profile/profile_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_toolbar.dart';
import '../../database/app_database.dart';
import 'all_review_helper.dart';

class AllReviewView extends StatelessWidget {
  const AllReviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children:  [
             CommonToolbar(toolText: "All Reviews(${Get.find<AppLocalStorage>().userDetail!.reviewCount!})"),
             const Expanded(child: AllReviewList())
          ]
        ),
      ),
    );
  }
}
