import 'package:flutter_clone_instagram/src/models/instagram_user.dart';
import 'package:flutter_clone_instagram/src/repository/user_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<InstagramUser> user = InstagramUser().obs;

  Future<InstagramUser?> loginUser(String uid) async {
    // db조회
    var userData = await UserRepository.loginUserById(uid);
    return userData;
  }

  void signup(InstagramUser signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if (result) {
      user(signupUser);
    }
  }
}
