// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_layout/DetailWidget.dart';

class DetailPage extends StatefulWidget {
  late final int data;
  DetailPage(this.data);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.toString()),
      ),
      body: DetailWidget(widget.data),
    );
  }
}
