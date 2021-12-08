import 'package:flutter/material.dart';

void main() => runApp(const CacApp());

class CacApp extends StatelessWidget {
  const CacApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CacApp',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CacApp'),
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
