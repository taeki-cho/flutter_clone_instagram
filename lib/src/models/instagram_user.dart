class InstagramUser {
  String? uid, nickname, thumbnail, description;
  InstagramUser({
    this.uid,
    this.nickname,
    this.thumbnail,
    this.description,
  });

  factory InstagramUser.fromJson(Map<String, dynamic> json) {
    return InstagramUser(
      uid: json['uid'] == null ? '' : json['uid'] as String,
      nickname: json['nickname'] == null ? '' : json['nickname'] as String,
      thumbnail: json['thumbnail'] == null ? '' : json['thumbnail'] as String,
      description:
          json['description'] == null ? '' : json['description'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nickname': nickname,
      'thumbnail': thumbnail,
      'description': description,
    };
  }

  InstagramUser copyWith({
    String? uid,
    nickname,
    thumbnail,
    description,
  }) {
    return InstagramUser(
      uid: uid ?? this.uid,
      nickname: nickname ?? this.nickname,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
    );
  }
}
