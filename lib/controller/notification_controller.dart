import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{
  static NotificationController get to => Get.find();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static String msg = '';

  //permission과 configue를 셋팅해야딘다.
  @override
  void onInit() {
    _initNotification();
    super.onInit();
  }

  void _initNotification() async{
    //권한 설정
    NotificationSettings settings = await _messaging.requestPermission(
      provisional: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  //   await Firebase.initializeApp();
  //   print('handing background message: ${message.messageId}');
  // }
}