// ignore_for_file: deprecated_member_use, unused_field, prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_null_comparison, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_layout/products/allproductsdata.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(DemoUploadImage());
}

class DemoUploadImage extends StatefulWidget {
  DemoUploadImage({Key? key}) : super(key: key);
  @override
  State<DemoUploadImage> createState() => _DemoUploadImageState();
}

class _DemoUploadImageState extends State<DemoUploadImage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Upload Image',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: UploadImageApi(), // AllProductsData or UploadImageApi
    );
  }
}

class UploadImageApi extends StatefulWidget {
  UploadImageApi({Key? key}) : super(key: key);

  @override
  State<UploadImageApi> createState() => _UploadImageApiState();
}

class _UploadImageApiState extends State<UploadImageApi> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();

  Future chooseImage() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  Future uploadImage() async {
    final uri = Uri.parse(
        "http://192.168.43.184/myphp/flutter-api/products/upload.php");
    var request = http.MultipartRequest('POST', uri);

    request.fields['product_name'] = nameCtrl.text;
    request.fields['product_price'] = priceCtrl.text;

    //var pic = await http.MultipartFile.fromPath("product_image", _image!.path);
    //request.files.add(pic);

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image uploaded!');
    } else {
      print('Image not uploaded!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                autofocus: true,
                controller: nameCtrl,
                decoration: InputDecoration(labelText: 'Enter product name'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: priceCtrl,
                decoration: InputDecoration(labelText: 'Enter product price'),
              ),
            ),
            IconButton(
              onPressed: () {
                chooseImage();
              },
              icon: Icon(Icons.photo_camera),
            ),
            Container(
              child: _image == null
                  ? Text('No Image Selected')
                  : Image.file(_image!),
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                uploadImage();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllProductsData(),
                  ),
                );
              },
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
