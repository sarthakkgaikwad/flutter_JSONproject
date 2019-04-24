import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import './models/image_models.dart';
import 'dart:convert';
import './widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    print('fectImage()');
    counter += 1;
    var response =
        await get('http://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build()');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFC1C9D9),
        appBar: AppBar(
          title: Text(
            'IMAGES',
            style: TextStyle(
                letterSpacing: 4.0,
                color: Color(0xFFC1C9D9),
                fontWeight: FontWeight.w300),
          ),
          backgroundColor: Color(0xFF011826),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF011826),
          onPressed: fetchImage,
          child: Icon(Icons.add),
        ),
        body: ImageList(images),
      ),
    );
  }
}
