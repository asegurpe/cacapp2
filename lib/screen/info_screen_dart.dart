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
        padding: const EdgeInsets.all(8.0),
        child: Text(AppLocalizations.of(context)!.about_text.capitalize()),
      ),
    );
  }
}
