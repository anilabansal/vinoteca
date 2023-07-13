import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/auth/login_controller.dart';
import 'package:vinoteca_app/modal/home/all_wines_list_modal.dart';
import 'package:vinoteca_app/view/auth/social_login/apple_helper.dart';
import 'package:vinoteca_app/view/auth/social_login/google_helper.dart';

import '../../controller/cart/cart_controller.dart';
import '../../controller/web_services/webservices_constants.dart';
import '../auth/social_login/facebook_helper.dart';
import 'common_button_widget.dart';
import 'common_image_widget.dart';
import 'common_text_widget.dart';

class LoginWithSocail extends StatelessWidget {
  const LoginWithSocail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: List.generate(
                    600 ~/ 10,
                    (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : Colors.grey,
                            height: 2,
                          ),
                        )),
              ),
              Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: CommonTextWidget(
                    msg: AppConstants.orViaSocialLink,
                    font: dSansRegular,
                    textSize: 14,
                    color: black525252,
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonSocial(blue4267B2, "asset/images/auth/img_fb_logo.svg",1),
            const SizedBox(
              width: 20,
            ),
            commonSocial(redFFB0AA1, "asset/images/auth/img_google_logo.svg",2),
            const SizedBox(
              width: 20,
            ),
            Platform.isIOS
                ? commonSocial(
                    black000000, "asset/images/auth/img_apple_logo.svg",3)
                : const SizedBox()
          ],
        )
      ],
    );
  }

  Widget commonSocial(Color color, String path,int type) {
    return InkWell(
      onTap: () async {
        if(type==1){
         // FacebookHelper().facebookLogin();
          FacebookUser? user= await FacebookHelper().facebookLogin();
          if(user!=null){
            Get.find<LoginController>().socialLoginApi("Facebook",user.id,user.email);
          }
        }else if(type==2){

         GoogleUser user= await GoogleLoginHelper().signInWithGoogle();
         if(user!=null){
           Get.find<LoginController>().socialLoginApi("Google",user.id,user.email);
         }

        }else if(type==3){


         AppleUser user= await AppleSignInHelper().appleSignIn();
         if(user!=null){
           Get.find<LoginController>().socialLoginApi("Apple",user.id,user.email);
         }
        }
      },
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: color, width: 1)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(path),
        ),
      ),
    );
  }
}

class CartItemAddSub extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? activeColor;
  final Color? unactiveColor;

  final WineData? wineData;


  const CartItemAddSub(
      {Key? key,
      this.height,
      this.width,
      this.backgroundColor,
      this.activeColor,
      this.unactiveColor,
      this.borderColor,
      this.wineData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CartController>(builder: (controller) {
      WineData _wine;
      if(controller!=null){
        _wine=controller.getWineExistInCart(wineData!);
      }else{
        _wine=wineData!;
      }

      return controller != null
          ? Container(
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            color: backgroundColor ?? pinkFDF3EF,
            border: Border.all(
                color: borderColor != null ? borderColor! : orangeDC571F),
            borderRadius: const BorderRadius.all(Radius.circular(6.0))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {

                if(_wine!=null){
                  controller.decreaseQuantity(_wine);
                }
              },
              child: commonBlock(!_wine.isIncreaseQuantity!, "-"),
            ),
            Container(
              height: height,
              width: width,
              alignment: Alignment.center,
              child: CommonTextWidget(
                  msg:_wine.buyQuantity.toString(),
                  font: dSansBold,
                  textSize: 16.0,
                  color: black525252),
            ),
            InkWell(
                onTap:() {

                  if(_wine!=null){
                    controller.increaseQuan(_wine);
                  }

                },
                child: commonBlock(_wine.isIncreaseQuantity!, "+"))
          ],
        ),
      )
          : const SizedBox();
    });
  }

  Widget commonBlock(bool isIncrease, String sign) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isIncrease ? activeColor :unactiveColor,
          borderRadius: const BorderRadius.all(Radius.circular(6.0))),
      child: CommonTextWidget(
          msg: sign, font: dSansBold, textSize: 16.0, color: black525252),
    );
  }
}

class TotalPricePay extends StatelessWidget {
  final String? btnText;
  final String? price;
  final VoidCallback? btnClick;

  const TotalPricePay({Key? key, this.btnText, this.btnClick,this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 10.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextWidget(
                  msg: "Total Price",
                  font: dSansRegular,
                  textSize: 14,
                  color: black525252,
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonTextWidget(
                  msg: "\$ ${price}",
                  font: dSansBold,
                  textSize: 18,
                  color: orangeDC571F,
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: CommonButton(
                msg: btnText,
                callback: () {
                  btnClick!();
                }),
          ))
        ],
      ),
    );
  }
}

class CommonDropDown extends StatelessWidget {

  String? hint;
  String? selected;
  List<String>? list;

  Function(String) onCallBack;
  CommonDropDown({Key? key, this.selected, this.list, this.hint,required this.onCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.zero,
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Text(hint!),
            value: selected,
            iconSize: 25.0,
            iconEnabledColor: Colors.black,
            style: const TextStyle(
                fontFamily: dSansRegular,
                fontSize: 16.0,
                color: black525252,
                fontWeight: FontWeight.w500),
            underline: const SizedBox(),
            onChanged: (c) {
              print(c);
              onCallBack(c!);
            },
            items: list!.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),

      ],
    );
  }
}

class FavoriteButton extends StatelessWidget {

  final double? height;
  final double? width;
  final bool? isLike;
  final VoidCallback? callback;
  const FavoriteButton({Key? key, this.height, this.width,this.isLike,this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 30,
        width: width ?? 30,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: isLike! ? const Icon(
          Icons.favorite,
          color: orangeDC571F,
        ): const Icon(
          Icons.favorite_border,
          color: black525252,
        ));
  }
}

class LoadingButton extends StatelessWidget {


  const LoadingButton({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height:30,
        width:30,
        padding: const EdgeInsets.all(2.0),
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: const CircularProgressIndicator());
  }
}

class CloseButtonCommon extends StatelessWidget {
  double? width;
  double? height;

  CloseButtonCommon({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        width: width ?? 35,
        height: height ?? 35,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: pinkFFF9F5),
        child: const Icon(Icons.close, color: redFFB0AA1),
      ),
    );
  }
}

class CommonWineBg extends StatelessWidget {
  final WineData? wineData;

  bool? showAddToCart=false;
  CommonWineBg({Key? key,this.wineData,this.showAddToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.8,
        width: MediaQuery.of(context).size.width * 0.4,
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  wineData!.bannerImage!=null &&  wineData!.bannerImage!.isNotEmpty ?
                  Padding(padding: const EdgeInsets.only(bottom: 10),
                    child: CommonImageView(borderRadius: BorderRadius.circular(10.0),image: WebServicesConstant.imageBaseUrl+wineData!.bannerImage.toString(),),) :
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: pinkFDF3EF,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(100))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Image.asset(
                            "asset/images/wine_store/img_bottle_glass.png"),
                      )
                    ],
                  ),
                  const Positioned(
                      right: 5, bottom: 50, child: FavoriteButton(isLike: true)),
                  Visibility(visible:showAddToCart!,child: Positioned(right:5,bottom:0,child: CartItemAddSub(width: 30,height: 30,backgroundColor: Colors.white,borderColor:Colors.white,unactiveColor: Colors.white,activeColor: greyD8D8D8,wineData: wineData!,)))
                ],
              ),
            ),
            const SizedBox(height: 2),
            CommonTextWidget(
              msg: wineData!.wineName,
              font: dSansBold,
              textSize: 18,
              maxLine: 2,
              color: black000000,
            ),
            Row(
              children: [
                CommonTextWidget(
                  msg: "750 ML for ",
                  font: dSansRegular,
                  textSize: 14,
                  color: black525252,
                ),
                CommonTextWidget(
                  msg: " \$ ${wineData!.price.toString()} ",
                  font: dSansBold,
                  textSize: 14,
                  color: orangeDC571F,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ImageWithSubImages extends StatelessWidget {
  double? bgImageWidth;
  double? bgImageHeight;

  ImageWithSubImages({Key? key, this.bgImageHeight, this.bgImageWidth})
      : super(key: key);
  List<String> imageList = [
    "asset/images/dummy/img_wine_review1.png",
    "asset/images/dummy/img_wine_review1.png",
    "asset/images/dummy/img_wine_review1.png",
    "asset/images/dummy/img_wine_review1.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: bgImageWidth!, maxHeight: bgImageHeight!),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Stack(
        children: [
          Image.asset("asset/images/dummy/img_wine_review1.png",
              fit: BoxFit.fill, width: bgImageWidth!, height: bgImageHeight!),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: bgImageWidth! / 2,
              height: 40,
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return images(imageList[index], index);
                  },
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget images(imagePath, index) {
    return index == 3
        ? Container(
            height: 35,
            width: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: Colors.white, width: 1)),
            child: CommonTextWidget(
              msg: "+2",
              textSize: 14.0,
              font: dSansMedium,
              color: black000000,
            ),
          )
        : Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: Colors.white, width: 1)),
            child: ClipRect(
              child: Image.asset(
                "asset/images/dummy/img_wine_review1.png",
                fit: BoxFit.fill,
              ),
            ));
  }
}


class ImageViewCommon extends StatelessWidget {
  double? imageWidth;
  double? imageHeight;
  String? image;
  String? fileImage;

  ImageViewCommon(
      {Key? key, this.imageWidth, this.imageHeight, this.image, this.fileImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight,
      width: imageWidth,
      child: fileImage != null && fileImage != ""
          ? Image.file(File(fileImage!),fit: BoxFit.fill,)
          : image == null
          ? nonProfile(imageWidth, imageHeight)
          : Image.network(
          image!,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            print(error); //do something
            return nonProfile(imageWidth, imageHeight);
          },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          }
        },
      ),
    );
  }

  Widget nonProfile(width, height) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: greyD8D8D8,
      ),
      child: Icon(
        Icons.photo,
        size: height / 2,
        color: Colors.white,
      ),
    );
  }
}

class CircularProgress extends StatelessWidget {
  double? width;
  double? height;

  CircularProgress({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height,
          width: width,
          child: const CircularProgressIndicator(color: orangeDC571F,),
        ),
      ],
    );
  }

}
