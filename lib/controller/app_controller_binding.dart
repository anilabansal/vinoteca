

import 'package:get/get.dart';
import 'package:vinoteca_app/controller/auth/login_controller.dart';
import 'package:vinoteca_app/controller/bottom_bar/wine_fundamental_controller.dart';
import 'package:vinoteca_app/controller/order_history/order_history_controller.dart';
import 'package:vinoteca_app/controller/payment/payment_controller.dart';
import 'package:vinoteca_app/controller/payment/square_payment_controller.dart';
import 'package:vinoteca_app/controller/profile/profile_controller.dart';
import 'package:vinoteca_app/controller/settings/contact_controller.dart';
import 'package:vinoteca_app/controller/store/filter_controller.dart';
import 'package:vinoteca_app/controller/store/store_detail_controller.dart';
import 'package:vinoteca_app/controller/top_rated/top_rated_tab_controller.dart';
import 'package:vinoteca_app/controller/wine_store/scan_controller.dart';
import '../database/app_database.dart';
import 'auth/create_profile_controller.dart';
import 'auth/forgot_pass_controller.dart';
import 'auth/signup_controller.dart';
import 'bottom_bar/bottom_bar_controller.dart';
import 'cart/cart_controller.dart';
import 'order_history/order_detail_controller.dart';
import 'region/region_controller.dart';
import 'settings/setting_controller.dart';
import 'wine_store/wine_detail_controller.dart';
import 'wine_store/wine_store_list_controller.dart';

class  AppControllerBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<WineController>(() => WineController());
    Get.lazyPut<SettingController>(() => SettingController());
    Get.lazyPut<OrderHistoryController>(() => OrderHistoryController());
    Get.lazyPut<BottomBarController>(() => BottomBarController());
    Get.lazyPut<StoreController>(() => StoreController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
    Get.lazyPut<CreateProfileController>(() => CreateProfileController());
    //Get.lazyPut<AppLocalStorage>(() => AppLocalStorage());
    Get.put<AppLocalStorage>(AppLocalStorage());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<WineFundamentController>(() => WineFundamentController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<WineDetailController>(() => WineDetailController());
    Get.lazyPut<ScanController>(() => ScanController());
    Get.lazyPut<RegionController>(() => RegionController());
    Get.lazyPut<PaymentController>(() => PaymentController());
    Get.lazyPut<SquarePaymentController>(() => SquarePaymentController());
    Get.lazyPut<TopRatedController>(() => TopRatedController());
    Get.lazyPut<FilterController>(() => FilterController());
    Get.lazyPut<OrderDetailController>(() => OrderDetailController());
  }
}