// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllProductsData extends StatefulWidget {
  AllProductsData({Key? key}) : super(key: key);

  @override
  State<AllProductsData> createState() => _AllProductsDataState();
}

class _AllProductsDataState extends State<AllProductsData> {
  Future allProducts() async {
    var url =
        "http://192.168.43.184/myphp/flutter-api/products/viewAllProducts.php";
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
      ),
      body: FutureBuilder(
        future: allProducts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    // List list = snapshot.data;
                    var data = snapshot.data[index];
                    return Card(
                      child: InkWell(
                        onTap: () {
                          // menuju ke detail
                          print(data['product_name']);
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.network(
                                  'http://192.168.43.184/myphp/flutter-api/products/uploads/${data['product_image']}'),
                            ),
                            Padding(padding: EdgeInsets.only(right: 18.0)),
                            Text(
                              data['product_name'],
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 18.0)),
                            Text(
                              data['product_price'],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
