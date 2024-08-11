import 'package:flutter_clone_instagram/src/models/instagram_user.dart';

class Post {
  final String? id;
  final String? thumbnail;
  final String? description;
  final int? likeCount;
  final InstagramUser? userInfo;
  final String? uid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  Post({
    this.id,
    this.thumbnail,
    this.description,
    this.likeCount,
    this.userInfo,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Post.init(InstagramUser userInfo) {
    return Post(
      thumbnail: '',
      userInfo: userInfo,
      uid: userInfo.uid,
      description: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  factory Post.fromJson(String docId, Map<String, dynamic> json) {
    return Post(
      id: json['id'] == null ? '' : json['id'] as String,
      thumbnail: json['thumbnail'] == null ? '' : json['thumbnail'] as String,
      description:
          json['description'] == null ? '' : json['description'] as String,
      likeCount: json['likeCount'] == null ? 0 : json['likeCount'] as int,
      userInfo: json['userInfo'] == null
          ? null
          : InstagramUser.fromJson(json['userInfo']),
      uid: json['uid'] == null ? '' : json['uid'] as String,
      createdAt: json['createdAt'] == null
          ? DateTime.now()
          : json['createdAt'].toDate() as DateTime,
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : json['updatedAt'].toDate() as DateTime,
      deletedAt: json['deletedAt'] == null
          ? null
          : json['deletedAt'].toDate() as DateTime,
    );
  }

  Post copyWith({
    String? id,
    String? thumbnail,
    String? description,
    int? likeCount,
    InstagramUser? userInfo,
    String? uid,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return Post(
      id: id ?? this.id,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
      likeCount: likeCount ?? this.likeCount,
      userInfo: userInfo ?? this.userInfo,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'thumbnail': thumbnail,
      'description': description,
      'likeCount': likeCount,
      'userInfo': userInfo!.toMap(),
      'uid': uid,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }
}
