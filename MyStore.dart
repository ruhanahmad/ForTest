// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutterappfood/Product.dart';
// import 'package:flutterappfood/user.dart';
// import 'package:http/http.dart' as http;
// import 'main.dart';
// import 'package:flutter/material.dart';
// import 'dart:async' show Future;
// import 'package:http/http.dart' as http;
//
//
//
// Store() async{
//   final response = await http.get("http://www.pwps.pk/GetDataFood.php");
//   final List<dynamic> ResponseData = jsonDecode(response.body);
//   List<Products> produc =[];
//   ResponseData.forEach((element) {
//     final Products product = Products.fromJson(element);
//     produc.add(product);
//   });
// }
//
//
//
//
// class MyStore extends ChangeNotifier{
//
//
//    List<Products> _product = [];
//   List<Products> _basket = [];
//    Products _activeproduct = null;
//
//   //
//   // Productone prod =new Productone();
//   //   List<Products> list = new List();
//   //
//   //   MyStore(){
//   //     prod.lists = list;
//   //   }
//   //  setData( Productone data) {
//   //
//   //     prod = data;
//   //        notifyListeners();
//   //  }
//   //
//   //  Productone GetData ()
//   //  {
//   //    return prod;
//   //  }
//   //
//   // Future<List<Productone>>  hitApi() async{
//   //     var response = await http.get("http://www.pwps.pk/GetDataFood.php");
//   //     final Map  parsed = json.decode(response.body);
//   //     Productone product = Productone.fromJson(parsed);
//   //
//   //          return product;
//
// // }
// MyStore() {
// _product = produc;
// }
//   // _product =prof;
//   //  notifyListeners();
//
//
//
//   // List<Products>  get products => _product;
//   List<Products>  get baskets => _basket;
//   Products get activeproduct => _activeproduct;
//
//    setActiveProduct(Products p) {
//      _activeproduct = p;
//    }
//
//    AddOneAddItemToBasket(Products p) {
//      Products found = _basket.firstWhere((a) => a.id == p.id,orElse: ()=>null);
//      if(found != null) {
//        found.qty += 1;
//
//      }
//      _basket.add(p);
//      notifyListeners();
//    }
//
//   RemoveOneAddItemToBasket(Products p) {
//     Products found = _basket.firstWhere((a) => a.id == p.id,orElse: ()=>null);
//     if(found != null && found.qty ==1) {
//       _basket.remove(p);
//     }
//     else{
//       found.qty -= 1;
//     }
//     notifyListeners();
//   }
//
//
//   getBasketQty() {
//     int total = 0;
//     for(int i = 0;i<baskets.length;i++){
//       total += baskets[i].qty;
//     }
//     return total;
//   }
//
//
// }
//
//
//
// //
// // class MyHomePageProvider extends ChangeNotifier {
// //   Products data;
// //    List<Products> productfor =[];
// //    List<Products> baskets =[];
// //    Products _activeproduct = null;
// //   Future getData(context) async {
// //     // You can call an API to get data, once we've the data from API or any other flow... Following part would always be the same.
// //     // We forgot about one more important part .. lets do that first
// //
// //     // We need access to BuildContext for loading this string and it's not recommended to store this context in any variable here
// //     // in change notifier..
// //     var response = await DefaultAssetBundle.of(context)
// //         .loadString('assets/raw/mJson.json');
// //     // now we have response as String from local json or and API request...
// //     var mJson = json.decode(response);
// //     // now we have a json...
// //     this.data = Products.fromJson(mJson);
// //     this.notifyListeners(); // for callback to view
// //   }
// //
// //
// // }