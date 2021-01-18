import 'dart:convert';

class User {
  int id;
  String username;
  String email;
  String avatar;

  User({this.id, this.username, this.email, this.avatar});

  static User fromJSON(String jsonUser) {
    return User.fromMap(json.decode(jsonUser));
  }

  static User fromMap(Map<String, dynamic> mapUser) {
    return User(
      id: mapUser['user_id'],
      username: mapUser['username'],
      email: mapUser['email'],
      avatar: mapUser['avatar'],
    );
  }

  String toJSON() {
    json.encode(this.toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': this.id,
      'username': this.username,
      'email': this.email,
      'avatar': this.avatar,
    };
  }
}
