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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            'CacApp is an application created to report citizens\' pet faeces that have been left on public roads.\n\nCacApp is not intended as an official reporting method, but rather as a way to raise awareness among citizens, regardless of their nationality, religion or other personal aspects.\n\nIf you have any questions or suggestions regarding the application only, please do not hesitate to contact us via our feedback form. For all other communications, please contact the competent authority.'),
      ),
    );
  }
}
