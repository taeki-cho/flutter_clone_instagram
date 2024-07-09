import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clone_instagram/src/models/instagram_user.dart';

class UserRepository {
  static Future<InstagramUser?> loginUserById(String uid) async {
    var data = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get();

    if (data.size == 0) {
      return null;
    } else {
      return InstagramUser.fromJson(data.docs.first.data());
    }
  }

  static Future<bool> signup(InstagramUser user) async {
    try {
      await FirebaseFirestore.instance.collection('users').add(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
