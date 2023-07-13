

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/region/region_controller.dart';
import 'package:vinoteca_app/controller/wine_store/wine_store_list_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';
import 'package:vinoteca_app/view/rating_review/rating_review_helper.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../controller/rating/rating_controller.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';


class RatingReviewView extends StatelessWidget {
  final int? wineId;
  const RatingReviewView({Key? key,this.wineId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: GetBuilder<RatingController>(builder: (controller){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Align(
              alignment: Alignment.center,
              child:CommonTextWidget(msg:AppConstants.RatingNReview,font: dSansBold,textSize: 22.0,color: black000000,) ,
            ),
            const SizedBox(
              height: 30,
            ),
            RatingWineView(),
            const SizedBox(
              height: 20,
            ),
            CommonTextWidget(msg:AppConstants.howYouRateWine,font: dSansBold,textSize: 18.0,color: orange432821,),
            const SizedBox(
              height: 20,
            ),
            RatingBar(
              initialRating: 3,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: Padding(padding: const EdgeInsets.all(5),child:SvgPicture.asset('asset/images/rating/img_full_star_yellow.svg')),
                half: Padding(padding: const EdgeInsets.all(8),child:Image.asset('asset/images/rating/img_half_star_yellow.png')),
                empty: Padding(padding: const EdgeInsets.all(5),child:SvgPicture.asset('asset/images/rating/img_border_star_yellow.svg')),
              ),
              itemPadding: EdgeInsets.zero,
              onRatingUpdate: (rating) {
                print(rating);
                controller.updateRating(rating);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            RatingTextFieldView(controller: controller.ratingReviewController),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(child: CancelButton(msg: AppConstants.Cancel,callback: (){},)),
                  const SizedBox(width: 10,),
                  Expanded(child: CommonButton(msg: AppConstants.submit,callback: (){
                    controller.rateWineOrTourGuide(wineId);
                  //
                  },)),
                ],
              ),
            )
          ],
        );
      })
    );
  }
}
