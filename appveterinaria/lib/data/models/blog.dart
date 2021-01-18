import 'dart:convert';

class Blog {
  int id;
  String name;
  String description;
  String image;

  Blog({
    this.id,
    this.name,
    this.description,
    this.image,
  });

  static Blog fromJSON(String jsonUser) {
    return Blog.fromMap(json.decode(jsonUser));
  }

  static Blog fromMap(Map<String, dynamic> map) {
    return Blog(
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
