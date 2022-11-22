import 'package:cloud_firestore/cloud_firestore.dart';

class Perfil {
  final String? name;
  final String? city;
  final String? country;
  final int? age;
  final String uid;
  final String imagen;
  final List<String>? friends;
  final List<DocumentReference>? rooms;


  Perfil({
    this.name="",
    this.city="",
    this.country="",
    this.age=0,
    this.uid = "",
    this.imagen="",
    this.friends = const [],
    this.rooms = const [],

  });

  factory Perfil.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
          ) {
        final data = snapshot.data();
        return Perfil(
          name: data?['name'],
          city: data?['city'],
          country: data?['country'],
          age: data?['age'],
          uid: snapshot.id,
          imagen: data?['imagen'],
          friends: data?['friends'] is Iterable ? List.from(data?['friends']) : null,
          rooms: data?['rooms'] is Iterable ? List.from(data?['rooms']) : null
        );
      }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (city != null) "city": city,
      if (country != null) "country": country,
      if (age != null) "age": age,
      if(imagen != null) "imagen": imagen,
      if (friends!.isNotEmpty) "friends": friends,
      if (rooms!.isNotEmpty) "rooms": rooms,
    };
  }
}