

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/profile/profile_controller.dart';
import 'profile_helper.dart';

class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ProfileController con=Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const UserDetail(),
        )
      )
    );
  }

}