import 'package:cacapp/widget/info_top_bar.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  static const String route = 'info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const InfoTopBar(),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
