import 'dart:convert';
import 'package:appveterinaria/data/models/blog.dart';
import 'package:appveterinaria/utils/constants.dart';
import 'package:appveterinaria/utils/jwt-utils.dart';
import 'package:http/http.dart' as http;

class ServiceBlog {
  String url = '$API_URL/api/blog';
  Future<List<Blog>> listAll() async {
    List<Blog> list;
    Map<String, String> headers = await JwtUtils.getTokenHeader();
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      print(body);
      var mapList = json.decode(body);
      list = mapList.map<Blog>((item) => Blog.fromMap(item)).toList();
    }
    return list;
  }

  Future<Blog> get(int id) async {
    Blog blog;
    Map<String, String> headers = await JwtUtils.getTokenHeader();
    var response = await http.get('$url/$id', headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      // la respuesta es una lista
      blog = Blog.fromJSON(response.body);
    }
    return blog;
  }
}
