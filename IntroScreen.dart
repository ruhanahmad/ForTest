import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'IntroModel.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
List<IntroModel> slides = new List<IntroModel>();
int currentIndex = 0;
PageController pageController = new PageController(initialPage: 0);
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget padeIndicator(bool isCurrentPage) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 2.0),
    height: isCurrentPage ?19.0 :6.0,
    width:  isCurrentPage ?19.0 :6.0,
    decoration:  BoxDecoration(
      color: isCurrentPage ? Colors.grey :Colors.green,
      borderRadius: BorderRadius.circular(12),

    ),
  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val){
            setState(() {
              currentIndex =val;
            });
          },
          itemBuilder: (context,index){
            return IntroSlider(
               Image:slides[index].getImagePath(),
               Title:slides[index].getTitle(),
              Description:slides[index].getDescription(),
                // color: slides[index].getColor(),
            );

          }),
            bottomSheet: currentIndex != slides.length -1 ?
            Container(
              height: Platform.isIOS ? 70:60,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        pageController.animateToPage(slides.length -1, duration: (Duration(microseconds: 400)), curve: Curves.bounceIn);
                      },
                      child: Text("SKIP"),
                  ),
                  Row(
                    children: [
                   for(int i=0;i<slides.length;i++) currentIndex == i ? padeIndicator(true):padeIndicator(false),

                    ],

                  ),
                  GestureDetector(
                    onTap: (){
                      pageController.animateToPage(currentIndex + 1, duration: (Duration(microseconds: 500)), curve: Curves.decelerate);
                    },
                    child: Text("Continue"),

                  ),
                ],
              ),
            ):Container(
              height: Platform.isIOS ? 70:60,
               color: Colors.blueAccent,
               child: Text("GetStarted"),
            ),
    );
  }
}
class IntroSlider extends StatelessWidget {
  String Image;
  String Title;
  String Description;
  Color color;
  IntroSlider({this.Description,this.Image,this.Title,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


            // Lottie.asset(Image),
            //   SizedBox(height: 20,),
              Text(Title),
              SizedBox(height: 20,),
              Text(Description),


        ],
      ),
    );
  }
}
