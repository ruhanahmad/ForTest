
import 'package:flutterappfood/Product.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class Services{

 static Future<List<Products>> getPosts() async {

try{

final response = await http.get("http://www.pwps.pk/GetDataFood.php");


final List<Products> listproducts = productsFromJson(response.body);
  
return listproducts; 







} catch(e) {
   return List<Products>();
}

}

}