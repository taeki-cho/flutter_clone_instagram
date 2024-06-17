import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      BottomNavController(),
      permanent: true, // 앱이 종료되는 시점까지 살아있게 설정
    );
  }
}
