import 'dart:convert';

import 'package:http/http.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutterappfood/FoodOrderMain.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart';
class Detail extends StatefulWidget {
  String Image;
  String name;

  Detail({this.Image,this.name,});


  @override
  _DetailState createState() => _DetailState();
}


class _DetailState extends State<Detail> {







  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;

  Future<List> webCall() async {
    // Showing CircularProgressIndicator using State.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String name = nameController.text;
    String email = emailController.text;
    String phoneNumber = phoneNumberController.text;

    // API URL
    var url = 'http://www.pwps.pk/cart.php';

    // Store all data with Param Name.
    var data = {
      'prodid': "name",
      'userid': "email",
      'qty': "phoneNumber",
      'status': "Opened",

    };
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'charset': 'utf-8'
    };
    // Starting Web Call with data.
     Response response = await http.post(url, body: json.encode(<String,String>{'prodid': "name", 'userid': "email", 'qty': "phoneNumber", 'status': "Opened",

    },
    ),
   headers: headers

    );

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }






        
     //    Future AddtoCart() async {
     //
     //      var Data={
     //        "prodid":12,
     //      "userid":12,
     //      "qty":2,
     //        "status":"opened",
     //
     //      };
     // var Response response = await http.post("http://www.pwps.pk/cart.php",body:json.encode(Data));
     // var message = jsonDecode(Response.body);
     //     if(response.statusCode == 200){
     //   setState(() {
     //    print("Hello flutter");
     //   });
     // }
     //     else {
     //      print("Hello fsslutter");
     //
     //      }
     //
     //
     //    }
        int _n = 0;
        void add() {
          setState(() {
            _n++;
          });
        }
        void minus() {
          setState(() {
            if (_n != 0)
              _n--;
          });
        }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],

        backgroundColor: Colors.red,

        
      ),
      body: ListView(
        children: [
          Container(
           height: 300,
            width: 300,
            child: Image.network(widget.Image),
          ),
          Container(
            height: 100,
            width: 100,
            child: RaisedButton(
            child: Text("Add to Cart"),
                onPressed: ()=>
                webCall(),


                

                ),
          ),
          Container(
            height: 100,
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
              IconButton(icon: Icon(Icons.ac_unit), onPressed: add),
                Text('$_n',style: TextStyle(fontSize: 18.0),),
                IconButton(icon: Icon(Icons.ac_unit), onPressed: minus),
              ],
            ),
          ),
          // Container(
          //   height: 100,
          //   width: 100,
          //   child: new Center(
          //     child: new Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: <Widget>[
          //         new FloatingActionButton(
          //           onPressed: add,
          //           child: new Icon(Icons.add, color: Colors.black,),
          //           backgroundColor: Colors.white,),
          //
          //         new Text('$_n',
          //             style: new TextStyle(fontSize: 60.0)),
          //
          //         new FloatingActionButton(
          //           onPressed: minus,
          //           child: new Icon(
          //               const IconData(0xe15b, fontFamily: 'MaterialIcons'),
          //               color: Colors.black),
          //           backgroundColor: Colors.white,),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
      
    );
  }
}
