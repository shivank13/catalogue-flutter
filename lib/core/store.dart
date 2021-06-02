import 'package:flutter_application/models/cart.dart';
import 'package:flutter_application/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore{
  CatalogueModel catalogue;
  CartModel cart;


Mystore(){
  catalogue=CatalogueModel();
   cart=CartModel();
   cart.catalogue=catalogue;
}
}