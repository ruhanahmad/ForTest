import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutterappfood/Detail.dart';
import 'package:flutterappfood/Product.dart';
import 'ProductDetailPage.dart';
import 'fortry.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'MainPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'services.dart';

bool IsLeft = false;

class TabBarV extends StatefulWidget {
  @override
  _TabBarVState createState() => _TabBarVState();
}

class _TabBarVState extends State<TabBarV> with SingleTickerProviderStateMixin {
  TabController tabController;
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TabBar _getTabBar() {
    return TabBar(
      // unselectedLabelColor: Colors.red,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.redAccent,
      ),
      tabs: <Widget>[
        Tab(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.redAccent,
                  width: 1,
                ),
              ),
              child: Image.asset(
                "asset/bed.jpg",
                fit: BoxFit.fill,
              )),
        ),
        Tab(icon: Icon(Icons.settings, color: Colors.redAccent)),
        Tab(
          child: Image.asset("asset/phot.jpeg"),
        ),
        Tab(
          child: Image.asset("asset/phot.jpeg"),
        ),
        Tab(
          child: Image.asset("asset/phot.jpeg"),
        ),
        Tab(
          child: Image.asset("asset/phot.jpeg"),
        ),
      ],
      controller: tabController,
    );
  }

  TabBarView _getTabBarView(tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xFF454545),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                Center(
                  child: Text(
                    "Order Food Regular",
                    style: GoogleFonts.kaushanScript(
                        fontSize: 26.0, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    "For Discounts Only",
                    style: GoogleFonts.pathwayGothicOne(
                        fontSize: 25.0, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          _getTabBar(),
          Container(
            height: MediaQuery.of(context).size.height,
            child: _getTabBarView(
              <Widget>[
                FoodOrderHome(),
                Icon(Icons.settings),
                Icon(Icons.home),
                Icon(Icons.home),
                Icon(Icons.home),
                Icon(Icons.home),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodOrderHome extends StatefulWidget {
  @override
  _FoodOrderHomeState createState() => _FoodOrderHomeState();
}

class _FoodOrderHomeState extends State<FoodOrderHome>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 2), () {
      completer.complete();
    });
    setState(() {
      getData();
    });
    return completer.future.then<void>((_) {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })));
    });
  }

  Future<List> getData() async {
    final response = await http.get("http://www.pwps.pk/GetDataFood.php");
    return json.decode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 6, vsync: this);
    getData();
  }

  Future<void> _getData() async {
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF151E27),
        resizeToAvoidBottomInset: false,
        body: ListView(children: [
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

                  return LiquidPullToRefresh(
                    onRefresh: _handleRefresh,
                    key: _refreshIndicatorKey,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2 + 80,
                      // height: MediaQuery.of(context).size.height,
                      // width: 1000,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: ss.data.length,
                          itemBuilder: (ctx, oo) {
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (Context) => Detail(


                                          Image:
                                              "http://www.pwps.pk/images/${ss.data[oo]['ImageUrl']}",
                                          name: ss.data[oo]['Name'],

                                      )
                                  )),
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
                                              ss.data[oo]['Name'],
                                              style: GoogleFonts.pacifico(
                                                  fontSize: 38),
                                            ),
                                            Text(
                                              ss.data[oo]['Subtitle'],
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              '${ss.data[oo]['Price']??"EMPTY"}',
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 40),
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          child: Image.network(
                                            "http://www.pwps.pk/images/${ss.data[oo]['ImageUrl']}",
                                            width: 300,
                                            height: 300,
                                            fit: BoxFit.fill,
                                          ),
                                        )),
//
//
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
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

//class Items extends StatefulWidget {
//  List list;
//
//  Items({this.list});
//
//  @override
//  _ItemsState createState() => _ItemsState();
//}
//
//class _ItemsState extends State<Items> {
//
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    getData();
//  }
//  Future<void> _getData() async {
//    setState(() {
//      getData();
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return RefreshIndicator(
//
//      child: Expanded(
//        flex: 5,
//        child: Container(
//          height: MediaQuery.of(context).size.height,
//          width: 1000,
//          child: ListView.builder(
//              itemCount: widget.list.length,
//              itemBuilder: (ctx, oo) {
//                return Card(
//                  color: Color(0xFF454545),
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(12.0)),
//                  child: Row(
//                    children: [
//                      Padding(
//                        padding: EdgeInsets.all(13),
//                        child: Column(
//                          children: [
//                            Text(
//                              widget.list[oo]['Name'],
//                              style: GoogleFonts.pacifico(fontSize: 38),
//                            ),
//                            Text(
//                              widget.list[oo]['Subtitle'],
//                              style: GoogleFonts.aBeeZee(fontSize: 20),
//                            ),
//                            Text(
//                              widget.list[oo]['Price'].toString(),
//                              style: GoogleFonts.aBeeZee(fontSize: 20),
//                            ),
//                          ],
//                        ),
//                      ),
//                      Padding(
//                          padding: EdgeInsets.only(left: 40),
//                          child: Expanded(
//                            flex: 1,
//                            child: Container(
//                                height: 200,
//                                width: 200,
//                                child: Image.network(
//                                  "http://www.pwps.pk/images/${widget.list[oo]['ImageUrl']}",
//                                  width: 200,
//                                  height: 200,
//                                  fit: BoxFit.fill,
//                                )),
//                          )),
////
////
//                    ],
//                  ),
//                );
//
//              }),
//        ),
//      ),
//      onRefresh: _getData,
//    );
//  }
//}
