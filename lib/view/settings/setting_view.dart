

import 'package:flutter/material.dart';
import 'package:vinoteca_app/view/settings/setting_helper.dart';
import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../common/utils/common_strings.dart';
import '../app_common_widgets/common_text_widget.dart';



class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(20.0),child: CommonTextWidget(msg:AppConstants.settings,textAlign: TextAlign.center,font: dSansBold,textSize: 22,color: black000000,),),
            Expanded(child: SingleChildScrollView(child: SettingOptions()))
          ],
        ),
      ),
    );
  }
}
