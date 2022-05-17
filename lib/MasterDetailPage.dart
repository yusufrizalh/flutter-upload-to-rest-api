// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, unused_import, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_layout/DetailPage.dart';
import 'package:flutter_adaptive_layout/DetailWidget.dart';
import 'package:flutter_adaptive_layout/ListWidget.dart';

class MasterDetailPage extends StatefulWidget {
  @override
  State<MasterDetailPage> createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  var selectedValue = 0;
  var isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adaptive Layout'),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }

        return Row(children: <Widget>[
          Expanded(
            child: ListWidget(10, (value) {
              if (isLargeScreen) {
                selectedValue = value;
                setState(() {});
              } else {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailPage(value);
                  },
                ));
              }
            }),
          ),
          isLargeScreen
              ? Expanded(child: DetailWidget(selectedValue))
              : Container(),
        ]);
      }),
    );
  }
}
