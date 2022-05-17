// ignore_for_file: prefer_const_constructors, prefer_void_to_null, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_generic_function_type_aliases, file_names

import 'package:flutter/material.dart';

typedef Null ItemSelectedCallback(int value);

class ListWidget extends StatefulWidget {
  late final int count;
  late final ItemSelectedCallback onItemSelected;

  ListWidget(this.count, this.onItemSelected);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Padding(
          padding: EdgeInsets.all(12.0),
          child: Card(
            child: InkWell(
              onTap: () {
                widget.onItemSelected(position);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      position.toString(),
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
