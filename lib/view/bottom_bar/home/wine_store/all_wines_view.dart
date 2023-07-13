

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'all_wines_helper.dart';


class AllWineView extends StatelessWidget {
  const AllWineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Column(
            children:   [
              const TopWineView(),
              Expanded(child: BottomWineView())
            ]
          ),
        ),
      )
    );
  }
}