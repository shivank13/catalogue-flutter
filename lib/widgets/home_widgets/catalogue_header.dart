import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
class MyHeader extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
           children:[
             "Catalogue App".text.xl5.bold.color(context.theme.accentColor).make(),
             "Trending products".text.xl2.make(),
           ],
    );
  }
}