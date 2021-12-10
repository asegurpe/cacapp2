import 'package:cacapp/screen/profile_screen.dart';
import 'package:cacapp/screen/reports_screen.dart';
import 'package:flutter/material.dart';

class MainTopBar extends StatefulWidget {
  final int totalReports;
  final int totalReportsViewed;

  const MainTopBar({
    Key? key,
    required this.totalReports,
    required this.totalReportsViewed,
  }) : super(key: key);

  @override
  State<MainTopBar> createState() => _MainTopBarState();
}

class _MainTopBarState extends State<MainTopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          IconButton(
            icon: Image.asset('assets/images/marker.png'),
            onPressed: () {
              Navigator.pushNamed(context, ReportsScreen.route);
            },
          ),
          Text('${widget.totalReports}')
        ]),
        Row(
          children: [
            Image.asset(
              'assets/images/radar.png',
              scale: 14,
            ),
            const SizedBox(width: 8),
            Text('${widget.totalReportsViewed}')
          ],
        ),
        IconButton(
          icon: Image.asset('assets/images/user.png'),
          onPressed: () {
            Navigator.pushNamed(context, ProfileScreen.route);
          },
        ),
      ],
    );
  }
}
