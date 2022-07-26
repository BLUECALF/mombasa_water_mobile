import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/AppController/app_controller.dart';
import 'package:mombasa_water/mw_icons_icons.dart';
import 'package:mombasa_water/pages/home/home_controller.dart';

class LeftDrawer extends GetView {
  HomeController homeController = Get.find<HomeController>();
  AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: TextButton.icon(icon:Icon(Icons.arrow_back,color: Colors.black),
          onPressed: (){Get.back();},label: Text(""),),
        title: Text("My Account",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(()=> ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    subtitle: Text(appController.current_account.value),
                    title: Text(appController.current_account_data[1]),leading:
                  Image.asset("others/svgtopng/user 1.png"),
                    trailing: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(width: 3,color: Colors.blue),
                        )
                      ),


                      child: Text("Switch Account",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black
                        ),
                      ),
                      onPressed: (){homeController.switch_acc();},),
                  ),
                ],
              ),
              ),
              Text("Support",
                  style:TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      letterSpacing: 2
                  )),
              ListView(
                shrinkWrap: true,
                children: [
                  homeController.make_list_tile(text: "Call Support", icon_data: MwIcons.suport_icon),
                  homeController.make_list_tile(text: "FAQ", icon_data: MwIcons.faqs_icon),
                  homeController.make_list_tile(text: "Mombasa Water Website", icon_data: MwIcons.water_icon),
                ],
              ),
              Text("About",
                  style:TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      letterSpacing: 2
                  )),
              ListView(
                shrinkWrap: true,
                children: [
                  homeController.make_list_tile(text: "Terms and Conditions", icon_data: MwIcons.terms_icon),
                  homeController.make_list_tile(text: "Privacy Policy", icon_data: MwIcons.privacy_policy),                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
