import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  

  CatalogueModel _catalogue;

  final List<int> _itemId=[];

  CatalogueModel get catalogue =>_catalogue;

  set catalogue(CatalogueModel newCatalogue)
  {  
     assert(newCatalogue!=null);
    _catalogue=newCatalogue;
  }


  //get items in the cart
  List<Item> get items=>_itemId.map((id) => _catalogue.getById(id)).toList();

  //get total price
  num get totalPrice=>items.fold(0,(total,current)=>total+current.price);


  //remove item
  
}


class AddMutation extends VxMutation<Mystore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    
    store.cart._itemId.add(item.id);
  }
  
}
class RemoveMutation extends VxMutation<Mystore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
  
    store.cart._itemId.remove(item.id);
  }
  
}