import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/style/colors.dart';

class ServicesContoller extends GetxController {

  AppBar make_appBar(String title)
  {
    return AppBar(
      title: Text(title, style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 17,
          color: Colors.white,
          letterSpacing: 3
      ),),
      centerTitle: true,
      backgroundColor: color_blue_light,
      shadowColor: Colors.transparent,
    );
  }
}
