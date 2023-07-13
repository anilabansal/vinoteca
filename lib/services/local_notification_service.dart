


import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;


  class LocalNotificationService {
  static final LocalNotificationService _localNotificationService =
  LocalNotificationService._internal();

  factory LocalNotificationService() {
    return _localNotificationService;
  }

  LocalNotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
     AndroidInitializationSettings('@mipmap/ic_launcher');
  //  AndroidInitializationSettings('@drawable/icon');

    // final IOSInitializationSettings initializationSettingsIOS =
    // IOSInitializationSettings(
    //   requestSoundPermission: true,
    //   requestBadgePermission: true,
    //   requestAlertPermission: true,
    //   onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    // );
    // final DarwinInitializationSettings initializationSettingsIOS =
    // DarwinInitializationSettings(
    //   requestSoundPermission: true,
    //   requestBadgePermission: true,
    //   requestAlertPermission: true,
    //   onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    // );

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        // iOS: initializationSettingsIOS,
        macOS: null);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        // onDidReceiveLocalNotification: (v){
        //   selectNotification(v);
        // }


        );

    /*final bool result =*/
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<String?> selectNotification(dynamic? payload) async {
    ///Handle notification tapped logic here
    print('=========> Notification Clicked - ${payload.toString()}');
    final data = json.decode(payload!);

    ///TODO: Handle notification click event
    // if (data['type'] == 'message') {
    //   Get.to(() => ChatScreen());
    // }
    //     {senderName: kavish, senderId: 63a405b8cb7cbf3a12a2800a, orderId: 63a9357873bce889ef53bb77, type: newMessage, roomId: 63a9358873bce889ef53bba3, senderImage: https://wainbh-1.s3.eu-west-1.amazonaws.com/1671693789840scaled_image_picker4978641741626327154.jpg}
    ///TODo: handle notification click event here
    if (data['type'] == 'newMessage') {
      // Get.to(
      //       () => ChatScreen(
      //     orderId: data['orderId'],
      //     receiverId: data['senderId'],
      //     name: data['senderName'],
      //     image: data['senderImage'],
      //     roomId: data['roomId'],
      //   ),
      // );
    }
  }

  void onDidReceiveLocalNotification(
      int? id, String? payload, String? payload1, String? payload2) async {
    ///Handle notification logic here
  }

  showNotification({
    int id = 123,
    String? title,
    String? message,
    String? image,
    Map<String, dynamic>? payload,
  }) async {
    ///Create channel specifics for iOS
    // final IOSNotificationDetails iOSPlatformChannelSpecifics =
    //     IOSNotificationDetails(
    // subtitle: 'hello ios'
    // attachments: <IOSNotificationAttachment>[
    //   IOSNotificationAttachment(largeIconPath)
    // ],
    // );


    // final DarwinNotificationDetails iOSPlatformChannelSpecifics =
    // DarwinNotificationDetails(
    //     subtitle: 'hello ios'
    // //     attachments: <IOSNotificationAttachment>[
    // //     IOSNotificationAttachment(largeIconPath)
    // // ],
    // );

    ///Create channel specifics for android
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    const AndroidNotificationDetails(
      'Wain Driver',
      'Wain Driver',
      channelDescription: 'Wain Driver Channel',
      importance: Importance.max,
      priority: Priority.max,
      ticker: 'ticker',
    );

    ///create platform channel specifics
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      // iOS: iOSPlatformChannelSpecifics,
    );

    ///show notification
    await flutterLocalNotificationsPlugin.show(
        id, title, message, platformChannelSpecifics,
        payload: json.encode(payload));
  }

  // Future<void> showBigPictureNotification({
  //   int id = 123,
  //   String? title,
  //   String? image,
  //   String? payload,
  // }) async {
  //   final ByteArrayAndroidBitmap largeIcon = ByteArrayAndroidBitmap(
  //     await _getByteArrayFromUrl(
  //       image!,
  //     ),
  //   );
  //   final ByteArrayAndroidBitmap bigPicture = ByteArrayAndroidBitmap(
  //     await _getByteArrayFromUrl(
  //       image,
  //     ),
  //   );
  //
  //   final BigPictureStyleInformation bigPictureStyleInformation =
  //   BigPictureStyleInformation(
  //     bigPicture,
  //     largeIcon: largeIcon,
  //     // contentTitle: 'overridden <b>big</b> content title',
  //     htmlFormatContentTitle: true,
  //     // summaryText: 'summary <i>text</i>',
  //     htmlFormatSummaryText: true,
  //   );
  //
  //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //   AndroidNotificationDetails('Wain_Driver', 'Wain Driver',
  //       channelDescription: 'Wain Driver Channel',
  //       importance: Importance.max,
  //       priority: Priority.max,
  //       ticker: 'ticker',
  //       styleInformation: bigPictureStyleInformation);
  //
  //
  //   const DarwinNotificationDetails iOSPlatformChannelSpecifics =
  //   DarwinNotificationDetails(
  //      subtitle: 'hello ios'
  //     // attachments: <IOSNotificationAttachment>[
  //     //   IOSNotificationAttachment(largeIconPath)
  //     // ],
  //   );
  //
  //   ///Create Notification detail
  //   final NotificationDetails platformChannelSpecifics = NotificationDetails(
  //       android: androidPlatformChannelSpecifics,
  //       iOS: iOSPlatformChannelSpecifics);
  //
  //   ///Show notification
  //   await flutterLocalNotificationsPlugin.show(
  //       id, title, "message", platformChannelSpecifics);
  // }

  // Future<Uint8List> _getByteArrayFromUrl(String url) async {
  //   ///Convert image url to byte array
  //   final http.Response response = await http.get(Uri.parse(url));
  //   return response.bodyBytes;
  // }

// Future<String> _downloadAndSaveFile(String url, String fileName) async {
//   ///Download image form network and store to local storage for iOS
//   final Directory directory = await getApplicationDocumentsDirectory();
//   final String filePath = '${directory.path}/$fileName';
//   final http.Response response = await http.get(Uri.parse(url));
//   final File file = File(filePath);
//   await file.writeAsBytes(response.bodyBytes);
//   return filePath;
// }
}