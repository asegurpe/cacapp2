import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:cacapp/widget/i18n_dropdown.dart';

class Enumerations {
  final BuildContext context;

  List<DropdownElement> language = [];

  Enumerations({required this.context}) {
    language = [
      DropdownElement(
        id: 1,
        text: AppLocalizations.of(context)!.automatic,
        values: {},
      ),
      DropdownElement(
        id: 2,
        text: 'Català',
        values: {'code': 'ca'},
      ),
      DropdownElement(
        id: 3,
        text: 'Castellano',
        values: {'code': 'es'},
      ),
      DropdownElement(
        id: 3,
        text: 'English',
        values: {'code': 'en'},
      ),
    ];
  }
}
