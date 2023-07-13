import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import 'package:vinoteca_app/controller/payment/square_payment_controller.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../common/utils/common_strings.dart';
import '../../controller/payment/payment_controller.dart';
import '../app_common_widgets/common_all_widget.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../app_common_widgets/common_toolbar.dart';
import 'address_helper.dart';

class AddressInformationView extends StatelessWidget {
  const AddressInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentController modal = Get.put(PaymentController());
    modal.getAllAddress();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonToolbar(
              toolText: "Address Information",
              color: Colors.transparent,
            ),
            CommonAddressFilled(),
          ],
        ),
      ),
    );
  }
}
