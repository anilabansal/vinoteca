


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_text_widget.dart';

class DeleteItemsCartDialog extends StatelessWidget {
 final String? msg;
 final String? title;
  const DeleteItemsCartDialog({Key? key,this.title,this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        children: [
          CommonTextWidget(msg: title,font: dSansBold,textSize: 20.0,color: black000000,),
          const SizedBox(height: 30,),
          CommonTextWidget(msg: msg,font: dSansMedium,textSize: 15.0,color: black000000,),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                  Get.find<CartController>().deleteOutOfStockItems();
                },
                child: Container(
                  padding: EdgeInsets.only(top:10,bottom: 10,right: 20,left:20),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6.0)
                  ),
                  child:CommonTextWidget(msg: "Yes",font: dSansMedium,textSize: 15.0,color: Colors.white,),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6.0)
                  ),
                  child:CommonTextWidget(msg: "Cancel",font: dSansMedium,textSize: 15.0,color: Colors.white,),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
