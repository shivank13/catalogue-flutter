import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
class CatalogueImage extends StatelessWidget {
  
  final String image;

  const CatalogueImage({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.network(image,).
          box.p8.color(context.canvasColor).make().p16().w40(context);
  }
}