import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_clone_instagram/src/binding/init_bindings.dart';
import 'package:flutter_clone_instagram/src/models/instagram_user.dart';
import 'package:flutter_clone_instagram/src/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<InstagramUser> user = InstagramUser().obs;

  Future<InstagramUser?> loginUser(String uid) async {
    // db조회
    var userData = await UserRepository.loginUserById(uid);
    if (userData != null) {
      user(userData);
      InitBindings.additionalBinding();
    }
    return userData;
  }

  void signup(InstagramUser signupUser, XFile? thumbnail) async {
    if (thumbnail == null) {
      _submitSungup(signupUser);
    } else {
      var fExt = thumbnail.path.split('.').last;
      var task = uploadXFile(thumbnail, '${signupUser.uid}/profile.$fExt');
      task.snapshotEvents.listen((event) async {
        print(event.bytesTransferred);
        if (event.bytesTransferred == event.totalBytes &&
            event.state == TaskState.success) {
          var downloadUrl = await event.ref.getDownloadURL();
          var updateUserData = signupUser.copyWith(thumbnail: downloadUrl);
          _submitSungup(updateUserData);
        }
      });
    }
  }

  UploadTask uploadXFile(XFile file, String filename) {
    var f = File(file.path);
    var ref = FirebaseStorage.instance.ref().child('users').child(filename);
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );
    return ref.putFile(f, metadata);
  }

  void _submitSungup(InstagramUser signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if (result) {
      loginUser(signupUser.uid!);
    }
  }
}
