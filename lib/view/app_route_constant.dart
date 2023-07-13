
import 'package:get/get.dart';
import 'package:vinoteca_app/controller/app_controller_binding.dart';
import 'package:vinoteca_app/view/auth/forgot_pass_view.dart';
import 'package:vinoteca_app/view/auth/login_view.dart';
import 'package:vinoteca_app/view/auth/otp_verification_done.dart';
import 'package:vinoteca_app/view/auth/otp_verification_view.dart';
import 'package:vinoteca_app/view/auth/reset_password_view.dart';
import 'package:vinoteca_app/view/auth/signup_view.dart';
import 'package:vinoteca_app/view/auth/splash_view.dart';
import 'package:vinoteca_app/view/bottom_bar/home/food_menu/food_menu_view.dart';
import 'package:vinoteca_app/view/bottom_bar/home/home_view.dart';
import 'package:vinoteca_app/view/bottom_bar/home/wine_store/wine_detail_view.dart';
import 'package:vinoteca_app/view/cart/checkout_view.dart';
import 'package:vinoteca_app/view/payment/add_card_in_app.dart';
import 'package:vinoteca_app/view/payment/address_information_view.dart';
import 'package:vinoteca_app/view/payment/payment_processing.dart';
import 'package:vinoteca_app/view/payment/shipping_address_view.dart';
import 'package:vinoteca_app/view/profile/all_reviews_view.dart';
import 'package:vinoteca_app/view/profile/edit_profile_view.dart';
import 'package:vinoteca_app/view/profile/my_rewards_view.dart';
import 'package:vinoteca_app/view/profile/profile_view.dart';
import 'package:vinoteca_app/view/rating_review/rating_review.dart';
import 'package:vinoteca_app/view/rating_review/rating_submitted.dart';
import 'package:vinoteca_app/view/settings/about_us_view.dart';
import 'package:vinoteca_app/view/settings/change_password_view.dart';
import 'package:vinoteca_app/view/settings/contact_us_view.dart';
import 'package:vinoteca_app/view/settings/favorite_wines_view.dart';
import 'package:vinoteca_app/view/settings/help_center_view.dart';
import 'package:vinoteca_app/view/settings/notification_view.dart';
import 'package:vinoteca_app/view/settings/setting_view.dart';
import 'package:vinoteca_app/view/settings/stores_list_view.dart';
import 'package:vinoteca_app/view/settings/term_services_view.dart';
import 'package:vinoteca_app/view/store/store_detail_view.dart';
import 'package:vinoteca_app/view/wine_tasting/list_wines_acc_region.dart';
import 'package:vinoteca_app/view/wine_tasting/region_detail.dart';
import 'package:vinoteca_app/view/wine_tasting/tasting_wine_tour_map.dart';
import 'package:vinoteca_app/view/wine_tasting/tasting_wine_tour_region.dart';
import 'package:vinoteca_app/view/bottom_bar/home/top_rated/top_rated_wines_region.dart';
import 'app_routes.dart';
import 'auth/create_profile_view.dart';
import 'bottom_bar/home/top_rated/top_rated_region_wines_map.dart';
import 'bottom_bar/home/wine_fundamental/wines_fundamental_view.dart';
import 'bottom_bar/main_screen.dart';
import 'bottom_bar/scan/scan_code.dart';
import 'bottom_bar/home/wine_store/all_wines_view.dart';
import 'cart/add_wine_from_fav.dart';
import 'cart/cart_view.dart';
import 'payment/payment_done.dart';
import 'payment/payment_methods.dart';
import 'order_history/history_view.dart';
import 'order_history/order_detail_view.dart';


/*
* This Class is used to set routes for the view
 */

class AppPages {
  static var list = [

    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      //page: () => const AddressInformationView(),
    ),
    // GetPage(
    //   name: AppRoutes.splash,
    //   page: () =>  BillingAddressView(),
    // ),

    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.forgotPass,
      page: () => const ForgotPassView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.otpVerify,
      page: () => const OtpVerificationView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.otpVerificationDone,
      page: () => const OtpVerificationDone(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.createProfile,
      page: () =>  CreateProfileView(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.addCard,
      page: () => const AddCardView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.resetPass,
      page: () => const ResetPassView(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.storeDetail,
      page: () => const StoreDetailView(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.mainScreen,
      page: () => const MainScreen(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.wineFundamental,
      page: () =>   WinesFundamentalView(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.ratingReview,
      page: () =>  const RatingReviewView(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.ratingDone,
      page: () =>  const RatingSubmittedView(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.wineDetail,
      page: () =>  const WineDetailView(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.allWines,
      page: () =>  const AllWineView(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.cart,
      page: () =>  const CartView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.checkOutView,
      page: () =>  const CheckOutView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.paymentDone,
      page: () =>  const PaymentDone(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.paymentMethods,
      page: () =>  const PaymentMethods(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.settingView,
      page: () =>  const SettingView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.chanegPassword,
      page: () =>  const ChangePassword(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.contactUs,
      page: () =>  const ContactUsView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.favoriteWine,
      page: () =>  const FavoriteWineView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.helpCenterView,
      page: () =>  const HelpCenterView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.termsServicesView,
      page: () =>  const TermsServicesView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.profileView,
      page: () =>   ProfileView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.editProfileView,
      page: () =>   EditProfileView(),
        binding: AppControllerBinding()
    ),
    // GetPage(
    //   name: AppRoutes.reviewDetail,
    //   page: () =>   ReviewDetailView(),
    // ),
    GetPage(
      name: AppRoutes.allReview,
      page: () =>   const AllReviewView(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.orderDetail,
      page: () =>  const OrderDetailView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.storeListView,
      page: () =>  const StoreListView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.aboutUs,
      page: () => const AboutUsView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.orderHistory,
      page: () =>   OrderHistoryView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.homeView,
      page: () =>   const HomeView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.myRewards,
      page: () =>   const MyRewardsView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.wineTastTourRegionList,
      page: () => const WineTastTourRegion(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.listWineAccRegionView,
      page: () => const ListWineAccRegionView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.wineTastTourMap,
      page: () => const WineTastTourMap(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.regionDetailView,
      page: () => const RegionDetailView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.addWineFromFavView,
      page: () =>  const AddWineFromFavView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.notificationView,
      page: () =>   const NotificationView(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.scanCodeView,
      page: () =>   const ScanCodeView(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.topRatedWineRegion,
      page: () => const TopRatedWineRegion(),
        binding: AppControllerBinding()
    ),

    GetPage(
      name: AppRoutes.wineRegionRatedMap,
      page: () =>   const WineRegionRatedMap(),
        binding: AppControllerBinding()
    ),
    GetPage(
      name: AppRoutes.shippingAddress,
      page: () =>   const ShippingAddressView(),
        binding: AppControllerBinding()
    ),

    GetPage(
        name: AppRoutes.foodMenuView,
        page: () =>   const FoodMenuView(),
        binding: AppControllerBinding()
    ),
    GetPage(
        name: AppRoutes.adressInformation,
        page: () =>   const AddressInformationView(),
        binding: AppControllerBinding()
    ),
  ];
}
