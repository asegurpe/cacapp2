import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  Group({
    required this.id,
    required this.name,
    required this.relationship,
  });

  String id;
  String name;
  Relationship relationship;

  factory Group.fromJson(String str) => Group.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Group.fromMap(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      name: json['name'],
      relationship: json['relationship'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'relationship': relationship,
      };
}

enum Relationship { belong, waiting, guest }
