// import 'package:flutterappfood/FoodOrderMain.dart';
// import 'package:flutterappfood/MyStore.dart';
// import 'package:provider/provider.dart';
//
// import 'main.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
//
// class ProductListPage extends StatefulWidget {
//   List data;
//   ProductListPage({this.data});
//   @override
//   _ProductListPageState createState() => _ProductListPageState();
// }
//
// class _ProductListPageState extends State<ProductListPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     var store = Provider.of<MyStore>(context);
//     print(store.products[0].Name);
//     return GridView.builder(
//           itemCount: store.products.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,i){
//             return
//                InkWell(
//
//                  onTap: (){
//                    store.setActiveProduct(store.products[i]);
//                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodOrderHome()));
//                  },
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 100,
//                       height: 100,
//                       child: FadeInImage.assetNetwork(placeholder: 'what a paratha', image: store.products[i].ImageUrl),
//                     ),
//                     Text(store.products[i].Name),
//                   ],
//                 ),
//                );
//
//
//
//
//
//     });
//   }
// }
