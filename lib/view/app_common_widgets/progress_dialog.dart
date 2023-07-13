

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// This class is for common progress indicator

class ProgressDialog {
  static AlertDialog? alert;
  static void showProgressDialog(BuildContext context) {
     alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "asset/images/progress/app_loader_wine.json",
                width: 120,
                height: 120,
                fit: BoxFit.fill,
                repeat: true,
              )
            ],
          )
        )
      )
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () async => true, child: alert!);
      },
    );
  }
}
