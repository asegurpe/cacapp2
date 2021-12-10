import 'package:flutter/material.dart';

class I18nDropdown extends StatelessWidget {
  List<DropdownMenuItem<DropdownElement>>? items;
  DropdownElement? item;
  Function(DropdownElement?) onChanged;

  I18nDropdown(
      {Key? key,
      required this.items,
      required this.item,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButton<DropdownElement>(
              items: items,
              underline: const SizedBox(),
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 30,
              value: item,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 18),
              onChanged: onChanged),
        )
      ],
    );
  }
}

class DropdownElement {
  final int id;
  final String text;
  final Map<String, String> values;

  DropdownElement({required this.id, required this.text, required this.values});

  @override
  String toString() {
    return text;
  }
}
