



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';


import 'common_text_widget.dart';

class CommonToolbar extends StatelessWidget {
  final String? toolText;
  final Color? color;
  const CommonToolbar({Key? key,required this.toolText,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color!=null ?color: Colors.white,
      height: kToolbarHeight,
      child: Stack(
        children: [
          Align(
           alignment: Alignment.centerLeft,
           child:  InkWell(
             onTap: (){
               //Get.toNamed("/");
               Get.back();
             },
             child: const Padding(
               padding: EdgeInsets.only(left:10.0),
               child: Icon(Icons.arrow_back_ios_outlined),
             ),
           ),
         ),
         Align(alignment: Alignment.center,child: CommonTextWidget(msg:toolText,textSize: 19.0,color: black000000,font: dSansBold,))

        ],
      ),
    );
  }
}



class CommonToolbarSuffix extends StatelessWidget {
  final String? toolText;
  final Color? color;
  final Widget? rightWidget;
  const CommonToolbarSuffix({Key? key,required this.toolText,this.color,this.rightWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color!=null ?color: Colors.white,
      height: kToolbarHeight,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child:  InkWell(
              onTap: (){
                //Get.toNamed("/");
                Get.back();
              },
              child: const Padding(
                padding: EdgeInsets.only(left:10.0),
                child: Icon(Icons.arrow_back_ios_outlined),
              ),
            ),
          ),
          Align(alignment: Alignment.center,child: CommonTextWidget(msg:toolText,textSize: 19.0,color: black000000,font: dSansBold,),)


,
          Align(alignment: Alignment.centerRight,child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: rightWidget,
          ))

        ],
      ),
    );
  }
}