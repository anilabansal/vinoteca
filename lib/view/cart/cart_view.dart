

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import '../../common/utils/common_strings.dart';
import '../app_common_widgets/common_toolbar.dart';
import 'cart_helper.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController=Get.put(CartController());
     cartController.getCartFromServer("cart_list");
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<CartController>(
              builder: (controller) {
                return CommonToolbar(
                  toolText: controller.cartList.isNotEmpty ? "${AppConstants.cart}(${controller.cartList.length})" : AppConstants.cart,
                  color: Colors.transparent,
                );
              }
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(20.0), child: CartItemList()),
            ),
            const WineCheckout()
          ],
        )
      )
    );
  }
}
