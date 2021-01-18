import 'dart:convert';

class Veterinario {
  int id;
  String name;
  String phone;
  String image;

  Veterinario({
    this.id,
    this.name,
    this.phone,
    this.image,
  });

  static Veterinario fromJSON(String jsonUser) {
    return Veterinario.fromMap(json.decode(jsonUser));
  }

  static Veterinario fromMap(Map<String, dynamic> map) {
    return Veterinario(
      id: map['id'],
      name: map['Nombre_Apellidos'],
      phone: map['Telefono_Celular'],
      image: map['Foto'],
    );
  }

  String toJSON() {
    json.encode(this.toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'Nombre_Apellidos': this.name,
      'Telefono_Celular': this.phone,
      'Foto': this.image,
    };
  }
}
