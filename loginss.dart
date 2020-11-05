import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';

import 'home.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class loginss extends StatefulWidget {
  @override
  _loginssState createState() => _loginssState();
}

class _loginssState extends State<loginss> {
  TextEditingController   email  =  new TextEditingController();
  TextEditingController   pass  =  new TextEditingController();

   Future Register() async{

     var Response = await http.post("http://www.pwps.pk/login.php",body: {
       "email" : email.text,
       "pass" : pass.text,
     });
     if(Response.body.isNotEmpty) {
       var Data =json.decode(Response.body);
          print(Data);

     }
     else{
       print ("error");
     }
     // var Data =  json.decode(Response.body);
     //  print(Data);
     // if(Data == "Error") {
     //   print("HighZone");
     //
     // }
     // else{
     //   Navigator.push(context,MaterialPageRoute(builder: (context)=>
     //       Shared(),
     //
     //   ));
     //
     // }


   }


  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          TextField(
            controller: email,
            decoration: InputDecoration(prefixIcon: Icon(Icons.account_box,),
                hintText: 'email'),
          ),


          TextField(
            controller: pass,
            decoration: InputDecoration(prefixIcon: Icon(Icons.lock,),
                hintText: 'pass'),
          ),

          SizedBox(height: 10.0,),

          MaterialButton(
              onPressed:() {
                Register();
              } ,
              child:  Text('Sign In',
                style: GoogleFonts.varelaRound(fontSize: 18.0,
                    color: Colors.blue),)
          ),

        ],
      ),
    );
  }
}
