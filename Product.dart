import 'dart:convert';
import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
 Products({
  this.id,
  this.name,
  this.username,
  this.passcode,
 });

 String id;
 String name;
 String username;
 String passcode;

 factory Products.fromJson(Map<String, dynamic> json) => Products(
  id: json["id"],
  name: json["name"],
  username: json["username"],
  passcode: json["passcode"],
 );

 Map<String, dynamic> toJson() => {
  "id": id,
  "name": name,
  "username": username,
  "passcode": passcode,
 };
}
