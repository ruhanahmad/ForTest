import 'dart:ui';

import 'package:flutter/material.dart';

class IntroModel {

  String ImagePath;
  String title;
  String Description;
  Color color;

  IntroModel({this.Description,this.ImagePath,this.title});

  void setImagePath(String getImage){
                ImagePath = getImage;
  }

  void SetTitle(String GetTitle){
           title = GetTitle;
  }

  void SetDescription (String GetDesc ) {

                 Description = GetDesc;
  }
  void SetColor(Color GetColor ) {
           color  = GetColor;
  }

  String getImagePath() {
    return ImagePath;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return Description;
  }
  Color getColor() {
    return color;
  }
}


List<IntroModel> getSlides() {
List<IntroModel> slides = new List<IntroModel>();

IntroModel introModel = new IntroModel();


introModel.setImagePath("RUhan");
introModel.SetTitle("Fries");
introModel.SetDescription("A natiral Disaster");
// introModel.SetColor(Colors.red);
slides.add(IntroModel());
 introModel = new IntroModel();
introModel.setImagePath("ruhan");
introModel.SetTitle("Fries");
introModel.SetDescription("A natiral Disaster");
// introModel.SetColor(Colors.green);
slides.add(IntroModel());
introModel = new IntroModel();
introModel.setImagePath("ruhan");
introModel.SetTitle("Fries");
introModel.SetDescription("A natiral Disaster");
// introModel.SetColor(Colors.yellow);
slides.add(IntroModel());
introModel = new IntroModel();

return slides;

}