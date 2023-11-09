import 'package:flutter/material.dart';
import 'package:aplikasi1/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi UTS',
      home: LoginPage(),
    );
  }
}

