import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cacapp/util/extensions.dart';
import 'package:cacapp/model/report.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  static const String route = 'reports';

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  bool onlyNoConfirmed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(AppLocalizations.of(context)!.reports.capitalize()),
            IconButton(
              icon: onlyNoConfirmed
                  ? const Icon(Icons.visibility_off, color: Colors.grey)
                  : const Icon(Icons.visibility, color: Colors.green),
              onPressed: _changeView,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          // padding: const EdgeInsets.all(10),
          children: _getReports(context),
        ),
      ),
    );
  }

  void _changeView() {
    onlyNoConfirmed = !onlyNoConfirmed;
    setState(() {});
  }

  List<Widget> _getReports(BuildContext context) {
    List<Report> reports = [
      Report(
        id: '1',
        cleaned: false,
        confirmed: true,
        consistency: 0,
        description: '01/01/2022 00:00',
        informer: '1341341',
        picture: '',
        size: 0,
        smell: 0,
      ),
      Report(
        id: '2',
        cleaned: false,
        confirmed: false,
        consistency: 0,
        description: '01/01/2022 00:00',
        informer: '1341341',
        picture:
            'https://www.k9ofmine.com/wp-content/uploads/2020/09/dog-pooping-inside-850x520.jpg',
        size: 0,
        smell: 0,
      ),
      Report(
        id: '3',
        cleaned: false,
        confirmed: false,
        consistency: 0,
        description: '01/01/2022 00:00',
        informer: '1341341',
        picture:
            'https://www.k9ofmine.com/wp-content/uploads/2020/09/dog-pooping-inside-850x520.jpg',
        size: 0,
        smell: 0,
      )
    ];

    return reports.map((report) {
      // if (report.picture.isEmpty) {
      return Dismissible(
        key: Key('${report.id}'),
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text(report.description),
                subtitle: Text(report.informer),
                leading: report.confirmed
                    ? const Icon(Icons.check, color: Colors.green)
                    : const Icon(Icons.check, color: Colors.grey),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
            ],
          ),
        ),
        direction: report.confirmed
            ? DismissDirection.startToEnd
            : DismissDirection.horizontal,
        background: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.delete, color: Colors.white),
                Text('Delete', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
        secondaryBackground: report.confirmed
            ? null
            : Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.check, color: Colors.white),
                      Text('Confirm', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
      );
    }).toList();
  }
}
