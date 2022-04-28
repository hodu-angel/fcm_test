import 'package:fcmtest/binding/init_binding.dart';
import 'package:fcmtest/controller/notification_controller.dart';
import 'package:fcmtest/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();  //비동기 안정성을 위해 파이어베이스 사용전 초기화 해줌
  await Firebase.initializeApp(); //controller에서 해줌
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  //await Firebase.initializeApp();
  print('handing background message: ${message.messageId}');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitBinding(),
      home: const Home(),
    );
  }
}