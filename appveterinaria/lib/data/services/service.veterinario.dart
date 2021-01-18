import 'dart:convert';
import 'package:appveterinaria/data/models/veterinarios.dart';
import 'package:appveterinaria/utils/constants.dart';
import 'package:appveterinaria/utils/jwt-utils.dart';
import 'package:http/http.dart' as http;

class ServiceVeterinario {
  String url = '$API_URL/api/veterinario';
  Future<List<Veterinario>> listAll() async {
    List<Veterinario> list;
    Map<String, String> headers = await JwtUtils.getTokenHeader();
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      print(body);
      var mapList = json.decode(body);
      list = mapList
          .map<Veterinario>((item) => Veterinario.fromMap(item))
          .toList();
    }
    return list;
  }

  Future<Veterinario> get(int id) async {
    Veterinario veterinario;
    Map<String, String> headers = await JwtUtils.getTokenHeader();
    var response = await http.get('$url/$id', headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      // la respuesta es una lista
      veterinario = Veterinario.fromJSON(response.body);
    }
    return veterinario;
  }
}
