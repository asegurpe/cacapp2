import 'package:cacapp/model/report.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  static const String route = 'friends';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
      ),
      body: ListView(
        children: _getReports(),
      ),
    );
  }

  List<Widget> _getReports() {
    List<Report> reports = [
      Report(
        cleaned: false,
        confirmed: false,
        consistency: 0,
        description: '01/01/2022 00:00',
        informer: '1341341',
        picture: '',
        size: 0,
        smell: 0,
      )
    ];

    return reports.map((report) {
      return ListTile(
        title: Text(report.description),
        subtitle: Text(report.informer),
        leading: Image(image: AssetImage('assets/images/marker.png')),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {},
      );
    }).toList();
  }
}
