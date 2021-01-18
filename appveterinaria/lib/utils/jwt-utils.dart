import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class JwtUtils {
  static Future<String> getToken() async {
    final storage = new FlutterSecureStorage();
    return await storage.read(key: 'jwt-token');
  }

  static Future<Map<String, String>> getTokenHeader() async {
    String token = await JwtUtils.getToken();
    return {
      'Authorization': 'Bearer $token',
    };
  }

  static bool isExpired(String token) {
    Map<String, dynamic> data = JwtUtils.decrypt(token);
    DateTime exp = DateTime.fromMillisecondsSinceEpoch(data['exp'] * 1000);
    DateTime now = DateTime.now();
    int c = now.compareTo(exp);
    return c < 0 ? false : true;
  }

  static Map<String, dynamic> decrypt(String token) {
    if (token == null) return null;
    final parts = token.split('.');
    final payload = parts[1];
    final String decoded = B64urlEncRfc7515.decodeUtf8(payload);
    Map<String, dynamic> data = jsonDecode(decoded);
    return data;
  }
}
