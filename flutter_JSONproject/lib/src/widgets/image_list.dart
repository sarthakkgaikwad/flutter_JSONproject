import 'package:flutter/material.dart';
import '../models/image_models.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding(
                child: Image.network(images[index].url),
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              Text(images[index].id.toString()),
            ],
          ),
        );
      },
    );
  }
}
