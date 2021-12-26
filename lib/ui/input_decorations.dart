import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      labelText: labelText,
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: Colors.black,
            )
          : null,
      hintText: hintText,
    );
  }
}
