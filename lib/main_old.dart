// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_layout/MasterDetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: MasterDetailPage(),
    );
  }
}
