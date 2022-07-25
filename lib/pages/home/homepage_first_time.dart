import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/AppController/app_controller.dart';
import "package:mombasa_water/mw_icons_icons.dart";
import 'package:mombasa_water/pages/common_page_controller.dart';
import 'package:mombasa_water/pages/services/detailed_services/desludging_service_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/sewer_service_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/water_tank_service_page.dart';
import 'package:mombasa_water/pages/services/services_controller.dart';

import 'home_controller.dart';


class HomePageFirstTime extends GetView<HomeController> {

  AppController appController = Get.find<AppController>();
  ServicesContoller servicesController = Get.put(ServicesContoller());
  HomeController homeController = Get.put(HomeController());
  CommonPageController commonPageController = Get.find<CommonPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey,
      appBar: homeController.make_appBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text("Set Up Your Accounts ",
                  style:TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 4
                  )
              ),
              SizedBox(height: 10),
              Text("Water E-bill offers support for a number of accounts and is constantly expanding support for more",
                  style:TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2
                  )),
              SizedBox(height: 10),
              Container(
                height: 150,width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextButton(
                onPressed: (){homeController.add_account(context);},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(MwIcons.add,color: Colors.white,size: 40,),
                      Text("Add Account",
                          style:TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4
                          )
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Services",
               style:TextStyle(
                   fontSize: 19,
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                   letterSpacing: 2
               )
                  ),
                  TextButton(child: Text("See all",
                      style:TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue
                  )),onPressed: (){
                    commonPageController.selected_index.value = 1;
                  })
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: homeController.make_button_with_png(path: "others/svgtopng/desludging icon.png",
                          function: (){Get.to(DesludgingServicePage());},text: "Desludging service"),
                    ),
                    Expanded(
                      flex: 1,
                      child: homeController.make_button(icon_name: MwIcons.water_tank_icon,
                          function: (){Get.to(WaterTankServicePage());},text: "Water Tank service"),
                    ),
                    Expanded(
                      flex: 1,
                      child: homeController.make_button(icon_name: MwIcons.sewer_icon,
                          function: (){Get.to(SewerServicePage());},text: "Sewer service"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
