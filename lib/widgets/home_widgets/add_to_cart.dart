import 'package:flutter/material.dart';
import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/cart.dart';
import 'package:flutter_application/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
class AddToCart extends StatelessWidget {
  final Item catalogue;
  
   AddToCart({
    Key key, this.catalogue,
  }) : super(key: key);

 
  

  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on: [AddMutation,RemoveMutation]);
     final CartModel _cart= (VxState.store as Mystore).cart;
     
     bool isInCart=_cart.items.contains(catalogue)?? false;
    return ElevatedButton(onPressed: (){
      if(!isInCart){
     
    AddMutation(catalogue);
     
      }
    },
     child:isInCart? Icon(Icons.done): Icon(Icons.shopping_cart),
     style: ButtonStyle(
       backgroundColor:MaterialStateProperty.all(context.theme.buttonColor),
       shape: MaterialStateProperty.all(StadiumBorder(),),
     )
     ,);
  }
}