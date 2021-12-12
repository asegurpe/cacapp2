import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.friendship,
    required this.points,
    required this.gender,
  });

  String id;
  String name;
  Friendship friendship;
  int points;
  int gender;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      friendship: json['friendship'],
      points: json['points'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'friendship': friendship,
        'poinbrts': points,
        'gender': gender,
      };
}

enum Friendship { friend, waiting, pending }
