import 'package:cacapp/provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cacapp/util/extensions.dart';
import 'package:cacapp/model/report.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  static const String route = 'reports';

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    ReportProvider reportProvider = Provider.of<ReportProvider>(context);

    reportProvider.getOwnReports();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset('assets/images/button/back.png'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(AppLocalizations.of(context)!.reports.capitalize()),
            IconButton(
              icon: Image.asset('assets/images/button/filter.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: reportProvider.getOwnReports(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Report>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final List<Report> reports = snapshot.data ?? [];
              if (reports.isEmpty) {
                return const Center(child: Text('No records'));
              }
              return ListView.builder(
                  itemCount: reports.length,
                  itemBuilder: (BuildContext context, int index) {
                    Report report = reports[index];

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
                              Text('Delete',
                                  style: TextStyle(color: Colors.white)),
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
                                    Text('Confirm',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                    );
                  });
            }),
      ),
    );
  }
}
