

import 'package:flutter/material.dart';


import 'home_helper.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children:  const [
            TopHomeView(),
            Expanded(
                child: WineOptionView())

          ]
        ),
      ),
    );
  }
}
