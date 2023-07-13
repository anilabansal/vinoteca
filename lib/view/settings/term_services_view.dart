import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../controller/settings/setting_controller.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../app_common_widgets/common_toolbar.dart';

class TermsServicesView extends StatefulWidget {
  const TermsServicesView({Key? key}) : super(key: key);

  @override
  State<TermsServicesView> createState() => _TermsServicesViewState();
}

class _TermsServicesViewState extends State<TermsServicesView> {



  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    controller.getTersmCondition();

    return Scaffold(
        backgroundColor: Colors.white,

      body:   SafeArea(
        child: Column(

          children: [
            const CommonToolbar(toolText: ""),
            CommonTextWidget(
              msg: "Terms and Services",
              font: dSansBold,
              textSize: 18,
              color: black000000,
            ),
           const SizedBox(height: 20,),
           Expanded(child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: GetBuilder<SettingController>(
               builder: (controoler) {
                 return WebViewWidget(controller: controoler.controller!,);
               }
             ),
           ))
          ],
        ),
      ),

    );
  }
}
