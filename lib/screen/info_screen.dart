import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cacapp/util/extensions.dart';

import 'package:cacapp/widget/info_top_bar.dart';

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
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(AppLocalizations.of(context)!.about_text_1.capitalize()),
            SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.about_text_2.capitalize()),
            SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.about_text_3.capitalize()),
          ],
        ),
      ),
    );
  }
}
