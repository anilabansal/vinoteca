

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/database/app_database.dart';
import '../app_common_widgets/gredient_view.dart';



class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: false);
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);
    navigateToScreen();

  }


  Timer navigateToScreen(){
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  void route(){
    if(AppLocalStorage().isLogin){
      Get.offNamed('/mainScreen');
    }else{
      Get.offNamed('/login');
    }
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("asset/images/auth/img_splash_bg.png", fit: BoxFit.fill),
          GredientView(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
          FadeTransition(
            opacity: _animation!,
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: Image.asset("asset/images/auth/img_logo_white.png")),
          )
        ],
      ),
    );
  }
}
