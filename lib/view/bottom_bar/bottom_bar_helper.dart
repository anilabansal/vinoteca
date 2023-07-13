

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/bottom_bar/bottom_bar_controller.dart';

class BottomBarItems extends StatelessWidget {
  Color? selectedColor;
  Color? unSelectedColor;
  String? selectedImage;
  String? unselectedImage;
  double? iconSize;
  String? title;
  int? index;
  BottomBarItems({Key? key,this.selectedImage,this.iconSize,this.index,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.find<BottomBarController>().onClickOption(index!);
      },
      child: Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(10.0),
        child: index!=2 ? SvgPicture.asset(selectedImage!) : Container() ,
      ),
    );
  }
}
