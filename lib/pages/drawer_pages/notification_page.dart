import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/AppController/app_controller.dart';
import 'package:mombasa_water/mw_icons_icons.dart';
import 'package:mombasa_water/pages/home/home_controller.dart';

class NotificationPage extends GetView {
  HomeController homeController = Get.find<HomeController>();
  AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: TextButton.icon(icon:Icon(Icons.arrow_back,color: Colors.black),
          onPressed: (){Get.back();},label: Text(""),),
        title: Text("Notification",
            style:TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 3
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Icon(MwIcons.notification_icon,size: 100,),
                Text("No Notification")
              ],
            ),
          )
        ),
      ),
    );
  }
}
