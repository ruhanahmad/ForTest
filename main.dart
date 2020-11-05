
import 'package:flutter/material.dart';
import 'package:flutterappfood/LoginSign.dart';
import 'package:flutterappfood/main.dart';
import 'package:flutterappfood/FoodOrderMain.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutterappfood/profileFetch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'IntroScreen.dart';
import 'MyStore.dart';
import 'Product.dart';
import 'first.dart';
import 'fortry.dart';
import 'package:animated_onboarding/animated_onboarding.dart';
import 'package:lottie/lottie.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home.dart';
import 'loginss.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// hitApi()async {
//  Productone prod = await Provider.of<MyStore>(context).hitApi();
//  Provider.of<MyStore>(context).setData(prod);
// }

  @override
  Widget build(BuildContext context) {
     // hitApi();
    return MaterialApp(
      theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      debugShowCheckedModeBanner: false,
//home: AppApp(),
//     home: Home(),
    home: Shared(),
//   home: Loginz(),
//     home: BottomNav(),
    // home: ProductList(),

//    home: HorizontalAndVerticalListView(),

    );
  }}

class Jkl extends StatefulWidget {
  @override
  _JklState createState() => _JklState();
}

class _JklState extends State<Jkl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(

        ),
        // child: ListView.builder(
        //     itemCount:Provider.of<MyStore>(context).GetData().lists.length ,
        //     itemBuilder: (BuildContext context,int i){
        //       return ListTile(
        //         leading: Text(Provider.of<MyStore>(context).GetData().lists[i].Name),
        //       );
        //     }),
      ),
    );
  }
}

class onBoard extends StatefulWidget {
  @override
  _onBoardState createState() => _onBoardState();
}

class _onBoardState extends State<onBoard> {
  final IntroKey = GlobalKey<IntroductionScreenState>();
  void _introEnd(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FoodOrderHome();
    }));
  }

  final pagedecoration = PageDecoration(
    titleTextStyle: TextStyle(fontSize: 38.0, fontWeight: FontWeight.w700,),
    bodyTextStyle: TextStyle(fontSize:19.0 ),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,

  );
  final pagedecorationtwo = PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize:19.0 ),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Color(0xFFD82426),
    imagePadding: EdgeInsets.zero,

  );
   hello() {
    return Container(
  child:Text("hello"),
    );
  }
  List<PageViewModel> getpages() {
    return [


      PageViewModel(
        title: hello(),
        image: Lottie.asset("asset/fallingfries.json",repeat: false),
        body: "With Natural Asepts",
        footer: Text(
          "ruhan ghod",
          style: TextStyle(color: Colors.black12),
        ),
        decoration:PageDecoration(
          titleTextStyle: TextStyle(fontFamily:'Satisfy' ,fontSize: 60.0,color: Colors.white),
          bodyTextStyle: TextStyle(fontSize:19.0 ,fontFamily:'Cuprum'),
          descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          pageColor: Color(0xFFF7BC26),
          imagePadding: EdgeInsets.zero,
        ) ,
      ),
      PageViewModel(
        title: "ruhan",
        image: Image.asset("lottiesjasonfiles/wow.png"),
        body: "ruhan is ruhan",
        footer: Text(
          "ruhan ghood",
          style: TextStyle(color: Colors.black12),
        ),
        decoration: pagedecoration,
      ),
      PageViewModel(
        image: Padding(
            padding: EdgeInsets.only(top:30.0),
            child: Lottie.asset("asset/burger.json",repeat: false)),
        title: "PIZZA",

        body: "ruhan is ruhan",
        footer: Text(
          "ruhan ghood",
          style: TextStyle(color: Colors.black12),
        ),
        decoration: pagedecorationtwo,
      ),
      PageViewModel(
        title: "ruhan",
        image: Image.asset("lottiesjasonfiles/wow.png"),
        body: "ruhan is ruhan",
        footer: Text(
          "ruhan ghood",
          style: TextStyle(color: Colors.black12),
        ),
        decoration: pagedecoration,
      ),
      PageViewModel(
        title: "ruhan",
        image: Image.asset("lottiesjasonfiles/wow.png"),
        body: "ruhan uhan",
        footer: RaisedButton(
          onPressed: () {
            IntroKey.currentState?.animateScroll(0);
          },
          child: const Text(
            'FooButton',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        decoration: pagedecoration,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        key: IntroKey,
        globalBackgroundColor: Colors.white,

        pages: getpages(),
        onDone: () {
          _introEnd(context);
        },
        showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          skip: const Text('Skip'),
          next: const Icon(Icons.arrow_forward),

//         RaisedButton(
//
//           onPressed: (){
//  Navigator.push(context, new MaterialPageRoute(builder: (context){
//   return model();
//  }));
//
//
//           }
//         ),


        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}

class slidertasty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  final List<Widget> _pages = [
    TabBarV(),
    Text("2"),
    Text("2"),
    ProfileFetch(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("hello"),
//      ),
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("Logs")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.folder_open,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.folder_open,
                color: Colors.indigo,
              ),
              title: Text("Folders")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.green,
              ),
              title: Text("Profile")),

        ],
      ),
      body: SafeArea(
        child: _pages[currentIndex],
      ),
    );

  }
}
