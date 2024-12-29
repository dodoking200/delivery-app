import 'package:flutter/material.dart';
import 'package:flutterproject/main_screen.dart';

import 'Stores_Screen.dart';
import 'login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}


