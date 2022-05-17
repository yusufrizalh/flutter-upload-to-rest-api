// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {
  late final int data;
  DetailWidget(this.data);

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.data.toString(),
            style: TextStyle(
              fontSize: 34.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
