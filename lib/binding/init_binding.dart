import 'package:fcmtest/controller/notification_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(NotificationController(), permanent: true);
  }
}