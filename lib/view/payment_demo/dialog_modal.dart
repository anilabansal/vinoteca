



import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';

import 'colors.dart';

Future<void> showAlertDialog(
    {required BuildContext context,
      required String title,
      required String description,
      required bool status}) =>
    showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          title: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  description,
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        ));