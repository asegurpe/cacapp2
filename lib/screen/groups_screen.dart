import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cacapp/util/extensions.dart';
import 'package:cacapp/model/report.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  static const String route = 'groups';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.groups.capitalize()),
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
