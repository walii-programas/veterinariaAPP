import 'dart:convert';

import 'package:appveterinaria/data/models/user.dart';
import 'package:appveterinaria/utils/constants.dart';
import 'package:appveterinaria/utils/jwt-utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  String url = '$API_URL/api/auth/login';

  Future<User> login(String username, String password) async {
    final storage = new FlutterSecureStorage();

    var response = await http.post(url, body: {
      'username': username,
      'password': password,
    });
    User user;
    if (response.statusCode == 200) {
      //leer el token
      Map<String, dynamic> data = jsonDecode(response.body);
      await storage.write(key: 'jwt-token', value: data['token']);
      // desentriptamos el token
      Map<String, dynamic> tokenData = JwtUtils.decrypt(data['token']);
      // instanciamos una clase user
      user = User.fromMap(tokenData);
      // Conventir el objeto usaurio en una cadena JSON
      String jsonUser = user.toJSON();
      await storage.write(key: 'user', value: jsonUser);
    }

    return user;
  }

  Future<bool> verifySession() async {
    final storage = new FlutterSecureStorage();
    String token = await storage.read(key: 'jwt-token');
    bool isExpired = false;
    if (token != null) {
      isExpired = JwtUtils.isExpired(token);
    }
    return isExpired;
  }

  void logout() {}

  User register(User user, String password) {}

  void changePassword(String id, String newPassword) {}
}
