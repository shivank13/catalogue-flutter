import 'package:flutter/material.dart';

import 'package:flutter_application/models/catalogue.dart';
import 'package:flutter_application/pages/home_detail_page.dart';
import 'package:flutter_application/widgets/home_widgets/add_to_cart.dart';

import 'package:velocity_x/velocity_x.dart';

import 'catalogue_image.dart';

class CatalogueList extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount:CatalogueModel.items.length ,
      itemBuilder: (context, index){
        final catalogue=CatalogueModel.items[index];
        return InkWell
        ( onTap: ()=>Navigator.push(context,
         MaterialPageRoute(builder:(context)=> HomeDetailPage(
           catalogue:catalogue,
         ),
         ),
         ),
          
          
          child: CatalogueItem(catalogue : catalogue),
           );
      },
    );
  }
}
class CatalogueItem extends StatelessWidget {
  
  final Item catalogue;

  const CatalogueItem({Key key,@required this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children:[
           Hero(
             tag: catalogue.id.toString(),
             child: CatalogueImage(image: catalogue.image)),
           Expanded(child: 
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
           children:[
             catalogue.name.text.lg.color(context.accentColor).bold.make(),
             catalogue.desc.text.make(),
             10.heightBox,
             ButtonBar(
               alignment: MainAxisAlignment.spaceBetween,
               buttonPadding: EdgeInsets.zero,
               children:[
                 "\$${catalogue.price}".text.bold.xl.make(),
                 AddToCart(catalogue:catalogue)
               ]
             ).pOnly(right:8.0)
           ]
           ))

        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

