

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'package:vinoteca_app/controller/bottom_bar/wine_fundamental_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_text_widget.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_toolbar.dart';

import '../../../app_common_widgets/common_all_widget.dart';


class FoodMenuView extends StatelessWidget {
  const FoodMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<WineFundamentController>().foodList();
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
              const CommonToolbar(toolText: "Food Menu", color: Colors.transparent),
                GetBuilder<WineFundamentController>(
                  builder: (controller) {

                    return controller.isLoading.value ? Center(child: CircularProgress(width: 40,height: 40))
                        :Wrap(
                      children: [
                        controller.menuList!.isNotEmpty ? ListView.builder(shrinkWrap:true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context,index){
                          return InkWell(
                            onTap: () async{
                                if (await canLaunchUrl(Uri.parse(controller.menuList![index].foodMenu1!))) {
                                     await launchUrl(Uri.parse(controller.menuList![index].foodMenu1!),mode: LaunchMode.externalApplication);
                                } else {
                                  throw 'Could not launch ';
                                }

                            // Get.to(()=> ShowWebView(link:controller.menuList![index].foodMenu1));
                            // Get.to(()=> WebViewExample());
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.width / 2,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      "asset/images/home/img_food_menu_bg.jpeg",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.black12.withOpacity(0.5),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: CommonTextWidget(
                                        msg: controller.menuList![index].type,
                                        color: Colors.white,
                                        font: georgiaBold,
                                        textSize: 50,
                                      ))
                                ],
                              ),
                            ),
                          );
                        },itemCount: controller.menuList!.length,) : const SizedBox()
                      ],
                    );
                  }
                )
    ])));
  }
}
