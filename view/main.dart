import 'package:flutter/material.dart';

import 'ApiAPP.dart';
import 'Cosmatic.dart';
import 'Lotte.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cosmatic(),
    );
  }
}
