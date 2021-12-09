import 'package:cacapp/model/report.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  static const String route = 'reports';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: _getReports(),
        ),
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
      ),
      Report(
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
      if (report.picture.isEmpty) {
        return Card(
          child: Column(
            children: [
              ListTile(
                title: Text(report.description),
                subtitle: Text(report.informer),
                leading: Image(image: AssetImage('assets/images/marker.png')),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: Text('CONFIRM')),
                  TextButton(onPressed: () {}, child: Text('DELETE')),
                ],
              ),
            ],
          ),
        );
      } else {
        return Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Column(
              children: [
                FadeInImage(
                  image: NetworkImage(report.picture),
                  placeholder: AssetImage('assets/images/marker.png'),
                  fadeInDuration: Duration(milliseconds: 200),
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    child: Text(report.description)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: Text('CONFIRM')),
                    TextButton(onPressed: () {}, child: Text('DELETE')),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    }).toList();
  }
}
