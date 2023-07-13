

import 'package:flutter/material.dart';

import 'rewards_helper.dart';

class MyRewardsView extends StatelessWidget {
  const MyRewardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
         mainAxisSize: MainAxisSize.max,
         children:  const [
           RewardsTopView(),
          Expanded(child: RewardsBottomView())
         ]
     ),
    );
  }
}