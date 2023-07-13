import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import 'local_notification_service.dart';

class FCMService {
  static final FCMService _fcmService = FCMService._internal();

  factory FCMService() {
    return _fcmService;
  }

  FCMService._internal();

  String? fcmToken;
  FirebaseMessaging? _messaging;

  init() {
    _messaging = FirebaseMessaging.instance;
  }

  handleBackgroundMessage() {
    FirebaseMessaging.onBackgroundMessage(_messageHandler);
  }

  Future<void> _messageHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print('background message ${message.notification!.body}');
  }

  Future<String> getFCMToken() async {
    String token = '';
    await _messaging!.getToken().then((value) {
      token = value!;
      fcmToken=token;
    });
    print('============FCM Token ---> $token');
    return token;
  }

  showForGroundMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      final data = message.data;

      // if (data['notificationType'] == 'calling') {
      //   ///Get the agora token for the calling
      //   print("+++++++++>Calling Payload ${data.toString()}");
      //   // CallingController()
      //   //     .getCallingToken(
      //   //   channelName: data['channelName'],
      //   //   uId: 0,
      //   // )
      //   //     .then((value) {
      //   //   ///Go to calling screen and connect with
      //   //   /// the calling channel
      //   //   if (value) {
      //   //     FlutterRingtonePlayer.playRingtone(
      //   //       volume: 4,
      //   //       looping: true,
      //   //     );
      //   //     Get.to(
      //   //           () => InComingScreen(
      //   //         name: data['name'],
      //   //         image: data['image'],
      //   //         channelName: data['channelName'],
      //   //         // uId: data['uId'],
      //   //         uId: 0,
      //   //       ),
      //   //     );
      //   //   } else {
      //   //     // ShowToast.show(
      //   //     //   title: 'Something went wrong!',
      //   //     //   message: 'Please try again!',
      //   //     // );
      //   //   }
      //   // });
      // }
      // else if (data['notificationType'] == 'endCall') {
      //   print("+++++++++>endCall Payload ${data.toString()}");
      //   // CallingController().disconnectCall();
      //
      // }  else {
      //   _handleNotification(message);
      // }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleMessageClick(message);
    });
  }

  _handleNotification(RemoteMessage remoteMessage) {
    LocalNotificationService().showNotification(
        id: Random().nextInt(1000),
        title: remoteMessage.notification!.title!,
        message: remoteMessage.notification!.body!,
        payload: remoteMessage.data);
  }

  _handleMessageClick(RemoteMessage message) {
    ///Handle all message notification click
    // print('=========> Notification Clicked - ${message.toString()}');

    ///TODo: handle notification click event here
  }
}