import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String? name;
  final String? city;
  final String? country;
  final int? age;


  Users({
    this.name,
    this.city,
    this.country,
    this.age,
  });

  factory Users.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
          ) {
        final data = snapshot.data();
        return Users(
          name: data?['name'],
          city: data?['city'],
          country: data?['country'],
          age: data?['age'],
        );
      }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (city != null) "city": city,
      if (country != null) "country": country,
      if (age != null) "age": age,
    };
  }
}