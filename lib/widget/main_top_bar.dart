import 'package:cacapp/screen/reports_screen.dart';
import 'package:flutter/material.dart';

class MainTopBar extends StatelessWidget {
  final int totalReports;

  const MainTopBar({Key? key, required this.totalReports}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          IconButton(
            icon: Image.asset(
              'assets/images/marker.png',
              scale: 5,
            ),
            onPressed: () {
              Navigator.pushNamed(context, ReportsScreen.route);
            },
          ),
          Text('${totalReports}')
        ]),
        Row(
          children: [
            Image.asset(
              'assets/images/radar.png',
              scale: 20,
            ),
            SizedBox(width: 8),
            Text('23')
          ],
        ),
        IconButton(
          icon: Image.asset(
            'assets/images/man.png',
            scale: 20,
          ),
          onPressed: () {
            // Navigator.pushNamed(context, ProfilePage.route);
          },
        ),
      ],
    );
  }
}
