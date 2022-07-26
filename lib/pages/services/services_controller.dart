import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesContoller extends GetxController {

  AppBar make_appBar(String title)
  {
    return AppBar(
      title: Text(title, style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          color: Colors.white,
          letterSpacing: 3
      ),),
      centerTitle: true,
      backgroundColor: Colors.blue,
      shadowColor: Colors.transparent,
    );
  }
}
