


import 'package:flutter/material.dart';
import 'package:vinoteca_app/view/bottom_bar/home/top_rated/top_rated_helper.dart';
import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../app_common_widgets/common_toolbar.dart';
import 'notification_helper.dart';



class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonToolbarSuffix(toolText: "Notification",color: Colors.transparent,rightWidget: CommonTextWidget(msg:"Clear",textSize: 14.0,color: yellowEEB83E,font: dSansMedium,),),

            Expanded(child: ListView.builder(itemBuilder: (context,index){
              return const NotificationListItem();
            },itemCount: 2,)),


          ],
        ),
      ),
    );
  }
}
