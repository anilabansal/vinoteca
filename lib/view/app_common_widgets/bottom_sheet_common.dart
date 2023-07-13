




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common_all_widget.dart';

/// This bottom sheet is used for showing store detail,rating and review...

class BottomSheetCommon {
  static void showSheet(Widget widget) {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
          height: MediaQuery.of(context).size.height*0.75,
          decoration:  const BoxDecoration(
            color: Colors.white,
            borderRadius:  BorderRadius.only(
              topLeft:  Radius.circular(25.0),
              topRight:  Radius.circular(25.0),
            ),
          ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CloseButtonCommon(width: 30,height: 30,),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: widget)),
        ],
      ),),

    );
  }
}