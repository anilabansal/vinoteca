

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/bottom_bar/wine_fundamental_controller.dart';
import 'package:vinoteca_app/view/app_common_widgets/common_toolbar.dart';
import 'package:vinoteca_app/view/bottom_bar/home/wine_fundamental/wine_funda_helper.dart';
import '../../../../common/utils/common_colors.dart';
import '../../../../common/utils/common_font.dart';
import '../../../app_common_widgets/common_all_widget.dart';
import '../../../app_common_widgets/common_text_widget.dart';


class WinesFundamentalView extends StatelessWidget {

  const WinesFundamentalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
            const CommonToolbar(toolText: "Wine Fundamentals",color: Colors.transparent),
            Expanded(
                child: GetBuilder<WineFundamentController>(
                  builder: (controller) {
                      return controller.isLoading.value ? CircularProgress(width: 40,height: 40)
                          :
                         Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: controller.list.isNotEmpty ? ListView.builder(itemBuilder: (context,index){
                             return  controller.list[index].subWineFundamentals!.isEmpty ? WineFundamentalOption(title:controller.list[index].title,leadingPath:controller.list[index].image,desc:controller.list[index].description ,)
                                 : WineFundamentalDispenser(title:controller.list[index].title,leadingPath:controller.list[index].image,list: controller.list[index].subWineFundamentals!,desc: controller.list[index].description);
                           },itemCount: controller.list.length) :  SizedBox(
                         child: CommonTextWidget(msg: "No Data Found",font: dSansRegular,textSize: 14.0,color: black525252,),
                    )

                     );
                   }
                ))
          ]
        )
      )
    );
  }
}
