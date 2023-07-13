import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/modal/home/store_detail_modal.dart';

import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_text_widget.dart';

class ViewAllWinesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: orangeFFEFE5,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("asset/images/store/img_wine_glasses.svg"),
          const SizedBox(
            width: 10,
          ),
          Text(
            AppConstants.ViewAllWines,
            style: const TextStyle(color: orangeDC571F, fontSize: 16.0),
          )
        ],
      ),
    );
  }
}

class StoreContactInfoView extends StatelessWidget {
  StoreContactInfoView({this.storeDetailModal});

  StoreDetailModal? storeDetailModal;

  @override
  Widget build(BuildContext context) {
    return storeDetailModal != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonWidget("asset/images/store/img_phone.svg", "Mobile Number",
                  storeDetailModal!.data!.mobileNumber, 1),
              Container(
                height: 1,
                color: greyD8D8D8,
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              ),
              commonWidget("asset/images/store/img_email.svg", "Email Id",
                  storeDetailModal!.data!.emailId, 2),
              Container(
                height: 1,
                color: greyD8D8D8,
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              ),
              commonWidget("asset/images/store/img_website.svg", "Website",
                  storeDetailModal!.data!.website, 3),
            ],
          )
        : SizedBox();
  }

  Widget commonWidget(image, title, desc, index) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: grey99F2F2F2),
              child: SvgPicture.asset(
                image,
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                      msg: title,
                      font: dSansBold,
                      textSize: 18.0,
                      color: black000000),
                  const SizedBox(
                    height: 5,
                  ),
                  CommonTextWidget(
                      msg: desc,
                      font: dSansRegular,
                      textSize: 16.0,
                      color: black525252),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreImageView extends StatelessWidget {
  StoreImageView({this.storeDetailModal});

  StoreDetailModal? storeDetailModal;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.grey.shade200),
        child: storeDetailModal!.data!.storeImage != null
            ? Stack(fit: StackFit.expand, children: [
                ClipRect(
                  child: Image.asset(
                    "asset/images/dummy/img_store.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                        "asset/images/store/img_store_social_bg.png")),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 20.0, right: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                            "asset/images/store/img_insta_white.svg"),
                        SvgPicture.asset(
                            "asset/images/store/img_twitter_white.svg"),
                        SvgPicture.asset("asset/images/store/img_fb_white.svg")
                      ],
                    ),
                  ),
                )
              ])
            : Icon(Icons.image_outlined, size: 50, color: Colors.white));
  }
}

class DetailView extends StatelessWidget {
  DetailView({this.storeDetailModal});

  StoreDetailModal? storeDetailModal;

  @override
  Widget build(BuildContext context) {
    return storeDetailModal != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidget(
                  msg: AppConstants.openingHours,
                  color: orangeDC571F,
                  font: dSansMedium,
                  textSize: 18.0),
              const SizedBox(
                height: 10,
              ),

              // CommonTextWidget(msg: "- Sunday to Thursday - 9am to 9pm",color: black525252,font: dSansRegular,textSize:14.0),
              // CommonTextWidget(msg: "- Friday and Saturday - 9am to 11pm",color: black525252,font: dSansRegular,textSize:14.0),
              // const SizedBox(
              //   height: 20,
              // ),


              Wrap(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: storeDetailModal!.data!.openingHours!.length,
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height /6),),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.all(2.0),
                         // color: Colors.blue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget(msg:storeDetailModal!.data!.openingHours![index].day!,font: dSansMedium,textSize: 15.0,),
                              CommonTextWidget(msg:storeDetailModal!.data!.openingHours![index].openingTime! +" AM - "+storeDetailModal!.data!.openingHours![index].closingTime!+" PM",font: dSansRegular,textSize: 14.0,),

                            ],
                          ),
                        );
                      })
                ],
              ),
              CommonTextWidget(
                  msg: storeDetailModal!.data!.storeName,
                  color: black000000,
                  font: dSansMedium,
                  textSize: 20.0),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_sharp,
                    color: orangeDC571F,
                  ),
                  CommonTextWidget(
                      msg: storeDetailModal!.data!.location,
                      color: black525252,
                      font: dSansRegular,
                      textSize: 16.0)
                ],
              )
            ],
          )
        : const SizedBox();
  }
}
