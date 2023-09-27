import 'package:flutter/material.dart';
import 'package:pixelpro/pages/initial_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitialPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}