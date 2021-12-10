import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.friendship,
  });

  String id;
  String name;
  Friendship friendship;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      friendship: json['friendship'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'friendship': friendship,
      };
}

enum Friendship { friend, waiting, pending }
