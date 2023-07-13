


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_text_widget.dart';

class ListOfCards extends StatelessWidget {

  const ListOfCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(itemBuilder: (context,index){
      return index==4 ? addNewCard():userOption();
    },itemCount: 5,);
  }

  Widget userOption(){
    return Container(
      margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 10.0,bottom: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: greyD8D8D8,width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8.0))

      ),
      child: Row(
        children: [
          const SizedBox(width: 10.0,height: 10.0),
          SvgPicture.asset("asset/images/payment/ic_radio_active.svg"),
          const SizedBox(width: 10),
          Expanded(child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [

             CommonTextWidget(msg:"Visa Card",font: dSansMedium,textSize: 18.0,color: black000000),
             const SizedBox(height: 8.0,),
             Padding(
               padding: const EdgeInsets.only(right:20.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 CommonTextWidget(msg:"37249*******",font: dSansRegular,textSize: 14.0,color: black525252,),
                CommonTextWidget(msg:"Exp:-23,june-22",font: dSansRegular,textSize: 14.0,color: black525252,),
               ],),
             )
           ],
          )),
          SvgPicture.asset("asset/images/cart/img_card_mastero.svg")
        ],
      )
    );
  }


  Widget addNewCard(){
    return InkWell(
      onTap: (){

        Get.toNamed("/addCard");
      },
      child: Container(
          margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 10.0,bottom: 10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border.all(color: orangeDC571F,width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(8.0))

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add,color: orangeDC571F),
              CommonTextWidget(msg:"Add New Card",font: dSansMedium,textSize: 18.0,color: orangeDC571F),
            ]
          )
      ),
    );
  }
}