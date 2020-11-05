import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'MainPage.dart';
import 'fortry.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart 'as http;
class ProfileFetch extends StatefulWidget {
  @override
  _ProfileFetchState createState() => _ProfileFetchState();
}

class _ProfileFetchState extends State<ProfileFetch> {

  Future<List> getData() async {
    final response = await http.get("http://www.pwps.pk/LoginGet.php");
    return   json.decode(response.body) ;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF151E27),
        resizeToAvoidBottomInset: false,

        body: ListView(
            children:
            [

//            Padding(
//              padding: EdgeInsets.all(12.0),
//              child: Builder(
//                builder: (context) => IconButton(
//                  icon: Icon(Icons.arrow_back,color: Colors.black87,),
//                  onPressed: () => Scaffold.of(context).openDrawer(),
//                ),
//              ),
//            ),


              // Padding(
              //   padding: EdgeInsets.all(12),
              //   child: Container(
              //     height: 70,
              //
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: products.length,
              //       itemBuilder: (Ctx, i) {
              //         return Card(
              //           color: Color(0xFF454545),
              //           child: Text(
              //             products[i].title,
              //             style: TextStyle(fontSize: 50.0, color: Colors.white),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.all(12),
                child: FutureBuilder<List>(
                  future: getData(),
                  builder: (ctx, ss) {
                    if (ss.hasError) {
                      return ss.error;
                    }
                    if (ss.hasData) {
//                    return Items(list: ss.data);

                      return Container(
                          height: MediaQuery.of(context).size.height/2 +80 ,
                          // height: MediaQuery.of(context).size.height,
                          // width: 1000,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: ss.data.length,
                              itemBuilder: (ctx, oo) {
                                return GestureDetector(
                                  onTap: ()=>
                                      Navigator.push(context, MaterialPageRoute(builder: (Context)=>
                                          MainPage())),
                                  child: Card(
                                    color: Color(0xFF001E37),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0)),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(13),
                                          child: Container(
                                            height: 150,
                                            width: 150,
                                            child: Column(
                                              children: [
                                                Text(
                                                  ss.data[oo]['email'],
                                                  style: GoogleFonts.pacifico(fontSize: 38),
                                                ),
                                                Text(
                                                  ss.data[oo]['pass'],
                                                  style: GoogleFonts.aBeeZee(fontSize: 20),
                                                ),
                                                Text(
                                                  ss.data[oo]['id'].toString(),
                                                  style: GoogleFonts.aBeeZee(fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
//                                         Padding(
//                                             padding: EdgeInsets.only(left: 40),
//                                             child: Container(
//                                               height:150,
//                                               width:150,
//                                               child: Image.network(
//                                                 "http://www.pwps.pk/images/${ss.data[oo]['ImageUrl']}",
//                                                 width: 300,
//                                                 height: 300,
//                                                 fit: BoxFit.fill,
//                                               ),
//                                             )),
// //
//
                                      ],
                                    ),
                                  ),
                                );

                              }),
                        );

                    } else {
                      return Container(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ]),
        endDrawer: Drawer(
          child: Column(
            children: [
              Text("ghgh"),
            ],
          ),
        ),
        drawer: Container(
          width: MediaQuery.of(context).size.width / 1.75,
          color: Colors.red,
        ),
      ),
    );
  }
}
