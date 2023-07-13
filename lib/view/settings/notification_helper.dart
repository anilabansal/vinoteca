



import 'package:flutter/material.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_text_widget.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check,color: green688D6B,),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: CommonTextWidget(msg: "Order Confirm ",font: dSansBold,textSize: 18.0,color: green688D6B,)),
                    CommonTextWidget(msg: "40 min ago ",font: dSansRegular,textSize: 12.0,color: black525252,)
                  ],
                ),
                CommonTextWidget(msg: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec mauris turpis. Quisque tristique ut erat sit amet ultrices.",font: dSansRegular,textSize: 14.0,color: black525252,),
                Container(
                  height: 1,
                  color: greyD8D8D8,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 8,bottom: 8),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonTextWidget(msg: "Sula Cabernet Shiraz ",font: dSansBold,textSize: 18.0,color: black000000,),
                          Row(children: [
                            CommonTextWidget(msg:"750 ML for ",font: dSansRegular,textSize: 14,color: black525252,),
                            CommonTextWidget(msg:" \$335 ",font: dSansBold,textSize: 14,color: orangeDC571F,),
                          ],),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("asset/images/dummy/img_order_detail.png",fit:BoxFit.fill,width: 50,height: 50,),
                    ),

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
