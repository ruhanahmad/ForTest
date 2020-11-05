// import 'MyStore.dart';
// import 'main.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class ProductList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var store = Provider.of<MyStore>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("hello Fliutter i am stuck"),
//         actions: <Widget>[
//           Text(store.getBasketQty().toString()),
//         ],
//       ),
//       body:Column(
//         children: [
//           Image.asset(store.activeproduct.ImageUrl),
//           Text(store.activeproduct.Name),
//           Text(store.activeproduct.Subtitle),
//            Row(
//              children: [
//                IconButton(icon: Icon(Icons.ac_unit_rounded), onPressed: (){
//                  store.AddOneAddItemToBasket(store.activeproduct);
//                }),
//                IconButton(icon: Icon(Icons.ac_unit_rounded), onPressed: (){
//                  store.RemoveOneAddItemToBasket(store.activeproduct);
//                }),
//              ],
//            ),
//         ],
//       ) ,
//     );
//   }
// }
//
