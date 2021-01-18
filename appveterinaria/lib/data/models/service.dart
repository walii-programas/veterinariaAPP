import 'dart:convert';

class Service {
  int id;
  String name;
  String description;
  String image;

  Service({
    this.id,
    this.name,
    this.description,
    this.image,
  });

  static Service fromJSON(String jsonUser) {
    return Service.fromMap(json.decode(jsonUser));
  }

  static Service fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'],
      name: map['Nombre'],
      description: map['Descripcion'],
      image: map['Foto'],
    );
  }

  String toJSON() {
    json.encode(this.toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'Nombre': this.name,
      'Descripcion': this.description,
      'Foto': this.image,
    };
  }
}
