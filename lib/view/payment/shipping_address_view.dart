import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/cart/cart_controller.dart';
import 'package:vinoteca_app/controller/payment/square_payment_controller.dart';

import '../../common/utils/common_colors.dart';
import '../../common/utils/common_font.dart';
import '../../common/utils/common_strings.dart';
import '../../controller/payment/payment_controller.dart';
import '../app_common_widgets/common_all_widget.dart';
import '../app_common_widgets/common_button_widget.dart';
import '../app_common_widgets/common_text_widget.dart';
import '../app_common_widgets/common_toolbar.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonToolbar(
              toolText: "Shipping Information",
              color: Colors.transparent,
            ),
            Expanded(child: SingleChildScrollView(
              child: GetBuilder<PaymentController>(builder: (controller) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonTextWidget(
                            msg: "Add Shipping Information",
                            font: dSansMedium,
                            textSize: 15,
                            color: black000000,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                  child: CommonTextFieldWidget(
                                      title: "${AppConstants.firstName}*",
                                      msg: "Enter First Name",
                                      textEditController:
                                          controller.firstNameEdt.value,
                                      font: dSansRegular,
                                      textSize: 16.0)),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: CommonTextFieldWidget(
                                      title: "${AppConstants.lastName}*",
                                      msg: "Enter Last Name",
                                      textEditController:
                                          controller.lastNameEdt.value,
                                      font: dSansRegular,
                                      textSize: 16.0)),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CommonTextFieldWidget(
                            title: "${AppConstants.mobileNo}*",
                            msg: "Enter Mobile Number",
                            font: dSansRegular,
                            textSize: 16.0,
                            textEditController: controller.mobileNoEdt.value,
                            inputType: TextInputType.phone,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CommonTextWidget(
                            msg: "Shipping Address",
                            font: dSansMedium,
                            textSize: 15,
                            color: black000000,
                          ),
                          const SizedBox(height: 15),
                          CommonTextFieldWidget(
                            title: "${AppConstants.streetAddress}*",
                            msg: "Enter Address",
                            textSize: 14.0,
                            font: dSansMedium,
                            textEditController:
                                controller.streetAddressEdt.value,
                          ),
                          const SizedBox(height: 15),
                          CommonTextFieldWidget(
                            title: "${AppConstants.apartment}*",
                            msg: "Enter Apartment",
                            textSize: 14.0,
                            font: dSansMedium,
                            textEditController: controller.apartmentEdt.value,
                          ),
                          const SizedBox(height: 15),
                          CommonTextFieldWidget(
                            title: "${AppConstants.suitNumber}*",
                            msg: "Enter Suit Number",
                            textSize: 14.0,
                            font: dSansMedium,
                            textEditController: controller.suitNoEdt.value,
                          ),
                          const SizedBox(height: 15),
                          CommonTextFieldWidget(
                            title: "${AppConstants.country}*",
                            msg: "Enter Country",
                            textSize: 14.0,
                            font: dSansMedium,
                            textEditController: controller.countryEdt.value,
                          ),
                          const SizedBox(height: 15),
                          CommonTextFieldWidget(
                            title: "${AppConstants.state}*",
                            msg: "Enter State",
                            textSize: 14.0,
                            font: dSansMedium,
                            textEditController: controller.stateEdt.value,
                          ),
                          const SizedBox(height: 15),
                          CommonTextFieldWidget(
                            title: "${AppConstants.city}*",
                            msg: "Enter City",
                            textSize: 14.0,
                            font: dSansMedium,
                            textEditController: controller.cityEdt.value,
                          ),
                          const SizedBox(height: 15),
                          CommonTextFieldWidget(
                            title: "${AppConstants.zipCode}*",
                            msg: "Enter ZipCode",
                            textSize: 14.0,
                            font: dSansMedium,
                            textEditController: controller.zipCodeEdt.value,
                          ),
                          const SizedBox(height: 20),

                          CommonButton(
                              msg: "Done",
                              callback: () {
                                controller.saveShipment();


                              }),
                        ],
                      ),
                    ),



                    // Container(
                    //   color: Colors.white,
                    //   child: Column(
                    //     children: [
                    //       const SizedBox(
                    //         height: 10,
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(
                    //             left: 20.0, right: 20, bottom: 10, top: 10),
                    //         child: Row(
                    //           children: [
                    //             SizedBox(
                    //                 width: 25,
                    //                 height: 25,
                    //                 child: Theme(
                    //                   data: Theme.of(context).copyWith(
                    //                     unselectedWidgetColor: Colors.grey,
                    //                   ),
                    //                   child: Checkbox(
                    //                     checkColor: Colors.white,
                    //                     activeColor: Colors.grey,
                    //                     shape: RoundedRectangleBorder(
                    //                         borderRadius:
                    //                             BorderRadius.circular(3)),
                    //                     value: true,
                    //                     onChanged: (value) {
                    //                       // Get.find<SignUpController>().agreeTerms();
                    //                     },
                    //                   ),
                    //                 )),
                    //             const SizedBox(width: 10),
                    //             CommonTextWidget(
                    //                 msg: "Same as billing address",
                    //                 font: dSansRegular,
                    //                 textSize: 14,
                    //                 color: black525252),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         height: 0.25,
                    //         width: MediaQuery.of(context).size.width,
                    //         color: Colors.grey,
                    //       ),
                    //       TotalPricePay(
                    //           price: Get.find<CartController>()
                    //               .totalOrderPrice
                    //               .toString(),
                    //           btnText: AppConstants.checkout,
                    //           btnClick: () {
                    //             controller.onSaveShipAddress();
                    //
                    //           })
                    //     ],
                    //   ),
                    // )
                  ],
                );
              }),
            )),
          ],
        ),
      ),
    );
  }
}
