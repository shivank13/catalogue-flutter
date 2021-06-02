import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/cart.dart';
import 'package:flutter_application/models/catalogue.dart';
import 'package:flutter_application/utils/route.dart';
import 'package:flutter_application/widgets/home_widgets/catalogue_header.dart';
import 'package:flutter_application/widgets/home_widgets/catalogue_list.dart';

import 'dart:convert';


import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatefulWidget {
 

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override



  void initState() { 
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(Duration(seconds:1));
    var catalogJson= await rootBundle.loadString("assets/files/catalogue.json");
    var decodeData=jsonDecode(catalogJson);
    var productData=decodeData["products"];
    CatalogueModel.items= List.from(productData).
    map<Item>((item) => Item.fromMap(item)).toList();
     setState((){});
  }
  Widget build(BuildContext context) {
    final _cart=(VxState.store as Mystore).cart;
   return Scaffold(
     backgroundColor: context.canvasColor,
     floatingActionButton: VxBuilder(
       mutations: {AddMutation,RemoveMutation},
           builder:(ctx,_,__)=> FloatingActionButton(
         onPressed: ()=>Navigator.pushNamed(context, MyRoute.cartRoute),
         backgroundColor: context.theme.buttonColor,
         child: Icon(CupertinoIcons.cart,
         color: Colors.white,),
       ).badge(color:Vx.red500, size:20, count:_cart.items.length),
     ),
     body: SafeArea(
            child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
           children:[
             MyHeader(),
             if(CatalogueModel.items !=null && CatalogueModel.items.isNotEmpty)
             CatalogueList().py16().expand()
             else
             Center(
               child: CircularProgressIndicator(),
             ),
           ],
         ),
       ),
     ),
     
    );
  }
}



