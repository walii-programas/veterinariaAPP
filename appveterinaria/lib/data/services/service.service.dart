import 'dart:convert';
import 'package:appveterinaria/data/models/service.dart';
import 'package:appveterinaria/utils/constants.dart';
import 'package:appveterinaria/utils/jwt-utils.dart';
import 'package:http/http.dart' as http;

class ServiceService {
  String url = '$API_URL/api/servicios';
  Future<List<Service>> listAll() async {
    List<Service> list;
    Map<String, String> headers = await JwtUtils.getTokenHeader();
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      print(body);
      var mapList = json.decode(body);
      list = mapList.map<Service>((item) => Service.fromMap(item)).toList();
    }
    return list;
  }

  Future<Service> get(int id) async {
    Service service;
    Map<String, String> headers = await JwtUtils.getTokenHeader();
    var response = await http.get('$url/$id', headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      // la respuesta es una lista
      service = Service.fromJSON(response.body);
    }
    return service;
  }
}
