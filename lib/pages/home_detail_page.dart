import 'package:flutter/material.dart';
import 'package:flutter_application/models/catalogue.dart';
import 'package:flutter_application/widgets/home_widgets/add_to_cart.dart';

import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
 final Item catalogue;

  const HomeDetailPage({Key key,@required this.catalogue}) : 
  assert(catalogue!=null),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: context.canvasColor,),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
             color:context.cardColor,
              child: ButtonBar(
                 alignment: MainAxisAlignment.spaceBetween,
                 buttonPadding: EdgeInsets.zero,
                 children:[
                   "\$${catalogue.price}".text.bold.xl4.red500.make(),
                   
                   AddToCart(catalogue:catalogue).wh(120,50),
                 ]
               ).p32(),
      ),
      body: SafeArea(
              child: Column(
          children:[
            Hero(
              tag: catalogue.id.toString(),
              child: Image.network(catalogue.image)
              ).h20(context).p16(),
          
          Expanded(
               child: VxArc(
                   height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                   color: context.cardColor,
                   width: context.screenWidth,
                   child: Column(
                     children: [
            catalogue.name.text.xl4.color(context.accentColor).bold.make(),
             catalogue.desc.text.textStyle(context.captionStyle).xl.make(),
             10.heightBox,
            " No invidunt takimata no sadipscing sea sit eos tempor tempor. Dolor kasd stet elitr sea eirmod est eos ea no. Consetetur dolore sea elitr labore, sea amet sed at dolore eos erat amet. Amet sit erat dolor nonumy sit stet invidunt stet at, no clita justo justo takimata consetetur at,.".text.textStyle(context.captionStyle).make().p8(),
                     ],
                   ).py64(),
                 ),
               ),
          )
          ],
        ),
      ),
     
    );
  }
}