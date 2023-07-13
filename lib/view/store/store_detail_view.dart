

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/controller/store/store_detail_controller.dart';
import 'package:vinoteca_app/view/store/store_detail_helper.dart';
import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../common/widgets/common_toolbar.dart';
import '../app_common_widgets/common_all_widget.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../app_common_widgets/common_toolbar.dart';

class StoreDetailView extends StatelessWidget {
  const StoreDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          CommonTextWidget(msg:AppConstants.storeFeatures,font: dSansBold,textSize: 22.0,color: black000000,) ,
          Padding(
              padding: const EdgeInsets.all(30.0),
              child: GetBuilder<StoreController>(
                   builder: (controller) {
                  return controller.storeDetailModal!=null ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StoreImageView(storeDetailModal:controller.storeDetailModal!),
                        const SizedBox(
                          height: 30,
                        ),
                        DetailView(storeDetailModal:controller.storeDetailModal!),

                        const SizedBox(
                          height: 30,
                        ),
                        Get.find<StoreController>().isShowStoreWines.value ? ViewAllWinesView(): StoreContactInfoView(storeDetailModal:controller.storeDetailModal!),

                      ]
                  ) : Center(child: CircularProgress(width: 40,height: 40),);
                }
              )
          ),
        ],
      ),
    );
  }
}
