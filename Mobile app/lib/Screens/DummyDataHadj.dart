import 'package:school/objects/ColorChoice.dart';
import 'package:school/objects/TodoObject.dart';
import 'package:flutter/material.dart';
class SpecialityModel{

  String imgAssetPath;
  String speciality;
  int noOfDoctors;
  Color backgroundColor;
  SpecialityModel({this.imgAssetPath,this.speciality,this.noOfDoctors, this.backgroundColor});
}
List<SpecialityModel> getSpeciality(){

  List<SpecialityModel> specialities = new List<SpecialityModel>();
  SpecialityModel specialityModel = new SpecialityModel();

  //1
  specialityModel.noOfDoctors = 10;
  specialityModel.speciality = "";
  specialityModel.imgAssetPath = "assets/img1.png";
  specialityModel.backgroundColor = Color(0xffFBB97C);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //2
  specialityModel.noOfDoctors = 17;
  specialityModel.speciality = "";
  specialityModel.imgAssetPath = "assets/images/Rectangle.png";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //3
  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "";
  specialityModel.imgAssetPath = "assets/images/Rectangle.png";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();


  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "";
  specialityModel.imgAssetPath = "assets/images/Rectangle.png";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();


  return specialities;
}