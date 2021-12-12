import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  Group({
    required this.id,
    required this.name,
    required this.relationship,
    required this.points,
  });

  String id;
  String name;
  Relationship relationship;
  int points;

  factory Group.fromJson(String str) => Group.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Group.fromMap(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      name: json['name'],
      relationship: json['relationship'],
      points: json['points'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'relationship': relationship,
        'points': points,
      };
}

enum Relationship { belong, waiting, guest }
