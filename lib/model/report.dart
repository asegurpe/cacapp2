import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';

class Report {
  Report({
    this.id,
    required this.cleaned,
    required this.confirmed,
    required this.consistency,
    required this.description,
    required this.informer,
    // required this.location,
    required this.picture,
    required this.size,
    required this.smell,
  });

  String? id;
  bool cleaned;
  bool confirmed;
  int consistency;
  String description;
  String informer;
  // GeoPoint location;
  String picture;
  int size;
  int smell;

  factory Report.fromJson(String str) => Report.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Report.fromMap(Map<String, dynamic> json) {
    return Report(
      id: json['id'],
      cleaned: json['cleaned'],
      confirmed: json['confirmed'],
      consistency: json['consistency'],
      description: json['description'],
      informer: json['informer'],
      // location: json['location'],
      picture: json['picture'],
      size: json['size'],
      smell: json['smell'],
    );
  }

  Map<String, dynamic> toMap() => {
        'cleaned': cleaned,
        'confirmed': confirmed,
        'consistency': consistency,
        'description': description,
        'informer': informer,
        // 'location': location,
        'picture': picture,
        'size': size,
        'smell': smell,
      };
}
