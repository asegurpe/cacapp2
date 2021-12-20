import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cacapp/util/preferences.dart';
import 'package:cacapp/model/models.dart';

class ReportProvider extends ChangeNotifier {
  late CollectionReference collection;
  Preferences prefs = Preferences();

  ReportProvider() {
    collection = FirebaseFirestore.instance.collection('reports');
  }

  Future<List<Report>> getOwnReports() async {
    Query query = collection.where('informer', isEqualTo: prefs.userId);
    QuerySnapshot querySnapshot = await query.get();
    List<Report> reports = querySnapshot.docs.map((DocumentSnapshot doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return Report.fromMap(data);
    }).toList();

    return reports;
  }
}
