import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import 'package:vinoteca_app/services/fcm_service.dart';
import 'package:vinoteca_app/services/local_notification_service.dart';
import 'package:vinoteca_app/view/app_routes.dart';
import 'package:vinoteca_app/view/map_tset/map_test.dart';
import 'package:vinoteca_app/view/payment_demo/config.dart';
import 'controller/app_controller_binding.dart';
import 'database/app_database.dart';
import 'view/app_route_constant.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance
      .setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  await GetStorage().initStorage;
  FCMService().init();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  await LocalNotificationService().init();
  AppLocalStorage().init();
  await InAppPayments.setSquareApplicationId(squareApplicationId);
  runApp(const MyApp());
}

Future<void> _messageHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    FCMService().showForGroundMessage();
    FCMService().getFCMToken();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.list,
      initialRoute: AppRoutes.splash,
      initialBinding: AppControllerBinding(),
      title: AppConstants.AppName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MapScreen(
      //   cityName: "Paris",
      // ),
    );
  }
}



// import 'dart:async';
// import 'dart:io' show Platform;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:square_in_app_payments/models.dart';
// import 'package:square_in_app_payments/in_app_payments.dart';
// import 'package:square_in_app_payments/google_pay_constants.dart'
// as google_pay_constants;
// import 'package:vinoteca_app/view/payment_demo/buy_sheet.dart';
// import 'package:vinoteca_app/view/payment_demo/colors.dart';
// import 'package:vinoteca_app/view/payment_demo/config.dart';
//
//
// void main() => runApp(MaterialApp(
//   title: 'Super Cookie',
//   home: HomeScreen(),
// ));
//
// class HomeScreen extends StatefulWidget {
//   HomeScreenState createState() => HomeScreenState();
// }
//
// class HomeScreenState extends State<HomeScreen> {
//   bool isLoading = true;
//   bool applePayEnabled = false;
//   bool googlePayEnabled = false;
//
//   static final GlobalKey<ScaffoldState> scaffoldKey =
//   GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _initSquarePayment();
//
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//   }
//
//   Future<void> _initSquarePayment() async {
//     await InAppPayments.setSquareApplicationId(squareApplicationId);
//
//     var canUseApplePay = false;
//     var canUseGooglePay = false;
//     if (Platform.isAndroid) {
//       await InAppPayments.initializeGooglePay(
//           squareLocationId, google_pay_constants.environmentTest);
//       canUseGooglePay = await InAppPayments.canUseGooglePay;
//     } else if (Platform.isIOS) {
//       await _setIOSCardEntryTheme();
//       await InAppPayments.initializeApplePay(applePayMerchantId);
//       canUseApplePay = await InAppPayments.canUseApplePay;
//     }
//
//     setState(() {
//       isLoading = false;
//       applePayEnabled = canUseApplePay;
//       googlePayEnabled = canUseGooglePay;
//     });
//   }
//
//   Future _setIOSCardEntryTheme() async {
//     var themeConfiguationBuilder = IOSThemeBuilder();
//     themeConfiguationBuilder.saveButtonTitle = 'Pay';
//     themeConfiguationBuilder.errorColor = RGBAColorBuilder()
//       ..r = 255
//       ..g = 0
//       ..b = 0;
//     themeConfiguationBuilder.tintColor = RGBAColorBuilder()
//       ..r = 36
//       ..g = 152
//       ..b = 141;
//     themeConfiguationBuilder.keyboardAppearance = KeyboardAppearance.light;
//     themeConfiguationBuilder.messageColor = RGBAColorBuilder()
//       ..r = 114
//       ..g = 114
//       ..b = 114;
//
//     await InAppPayments.setIOSCardEntryTheme(themeConfiguationBuilder.build());
//   }
//
//   Widget build(BuildContext context) => MaterialApp(
//       theme: ThemeData(canvasColor: Colors.white),
//       home: Scaffold(
//           body: isLoading
//               ? Center(
//               child: CircularProgressIndicator(
//                 valueColor:
//                 AlwaysStoppedAnimation<Color>(mainBackgroundColor),
//               ))
//               : BuySheet(
//               applePayEnabled: applePayEnabled,
//               googlePayEnabled: googlePayEnabled,
//               applePayMerchantId: applePayMerchantId,
//               squareLocationId: squareLocationId)));
// }
