import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'package:vinoteca_app/controller/web_services/webservices_constants.dart';
import 'package:vinoteca_app/controller/wine_store/wine_detail_controller.dart';

import '../app_common_widgets/common_text_widget.dart';

class RatingTopView extends StatelessWidget {
  const RatingTopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 40,
            height: 40,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: pinkFFF9F5),
            child: const Icon(Icons.close, color: redFFB0AA1),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CommonTextWidget(
            msg: "Rating & Review",
            font: dSansBold,
            textSize: 22.0,
            color: black000000,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        RatingWineView(),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        CommonTextWidget(
          msg: "How you rate the wine ?",
          font: dSansBold,
          textSize: 18.0,
          color: orange432821,
        )
      ],
    );
  }
}

class RatingTextFieldView extends StatelessWidget {
  final TextEditingController? controller;

  const RatingTextFieldView({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: greyD8D8D8, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: controller ??  TextEditingController(),
        style: const TextStyle(
            fontFamily: dSansRegular, color: orange432821, fontSize: 13),
        decoration: const InputDecoration(
            hintText: 'Enter Your Review',
            hintStyle: TextStyle(
                fontFamily: dSansRegular, color: black525252, fontSize: 13),
            border: InputBorder.none),
      ),
    );
  }
}

class RatingWineView extends StatelessWidget {
  final String? bannerImage;
  final List<String>? imageList;

  RatingWineView({Key? key, this.bannerImage, this.imageList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 230,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100.0),
                  topLeft: Radius.circular(100.0))),
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: bannerImage != null
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    constraints: const BoxConstraints(maxHeight: 230),
                    child: Image.network(
                      bannerImage!,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        print(error); //do something
                        return Image.asset(
                          "asset/images/wine_store/img_bottle_glass.png",
                          height: 230,
                        );
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
                    ),)
                : Align(
              alignment: Alignment.center,
              child: Image.asset("asset/images/wine_store/img_bottle_glass.png",
                  height: 230),
            )),
        // imageList != null && imageList!.isNotEmpty
        //     ? Positioned(
        //         right: 0,
        //         bottom: 60,
        //         child: Column(
        //             children: imageList!
        //                 .map((item) => commonWidget(
        //                     WebServicesConstant.imageBaseUrl + item,
        //                     imageList!.indexOf(item)))
        //                 .toList()))

        imageList != null && imageList!.isNotEmpty
            ? Positioned(
            right: 0,
            bottom: 60,
            child: Column(
                children: imageList!
                    .map((item) => commonWidget(
                    WebServicesConstant.imageBaseUrl + item,
                    imageList!.indexOf(item)))
                    .toList())
          // child: Wrap(
          //   children: [
          //     SizedBox(
          //       width:80,
          //       child: ListView.builder(shrinkWrap:true,itemBuilder: (context,index){
          //         return Container(height: 50,width: 50,color: Colors.red,);
          //       }),
          //     )
          //   ],
          // )
        )
            : const SizedBox(),
      ],
    );
  }

  Widget commonWidget(String? image, int index) {
    return index < 2
        ? InkWell(
           onTap: (){
             print("tap******************");
             Get.find<WineDetailController>().updateBanner(image!);
           },
          child: Obx(()=>
             Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
                decoration: BoxDecoration(
                    color: greyD8D8D8,
                    border: Border.all(color: image==Get.find<WineDetailController>().bannerImage.value ? orangeDC571F :Colors.white, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: image != null
                    ? Image.network(image)
                    : Image.asset(
                        "asset/images/rating/img_short_wine.png",
                        height: 40,
                        width: 40,
                      ),
              ),
          ),
        )
        : noOfWidget();
  }

  Widget noOfWidget() {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Text("+${imageList!.length - 2}"),
      //child: image!=null ? Image.network(image) :Image.asset("asset/images/rating/img_short_wine.png",height: 40,width: 40,),
    );
  }
}
