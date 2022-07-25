import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/AppController/app_controller.dart';
import "package:mombasa_water/mw_icons_icons.dart";
import 'package:mombasa_water/pages/home/home_controller.dart';
import 'package:mombasa_water/pages/home/homepage_first_time.dart';
import 'package:mombasa_water/pages/home/homepage_personal.dart';
import 'package:mombasa_water/pages/services/detailed_services/desludging_service_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/illegal_fee_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/sewer_service_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/water_tank_service_page.dart';
import 'package:mombasa_water/pages/services/services_controller.dart';


class HomePage extends GetView<HomeController>{

  AppController appController = Get.find<AppController>();
  ServicesContoller servicesController = Get.put(ServicesContoller());
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
   return Obx(() => Scaffold(
     body: choose_home(context),
   ));
  }
  Widget choose_home(BuildContext context)
  {
    if(appController.isFirstTime())
    {return HomePageFirstTime();}
    else if(appController.isCurrentUserSelected())
    {
      return HomePagePersonal();
    }
    else{
      return Scaffold(
        key: homeController.scaffoldKey,
        appBar:homeController.make_appBar(),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your accounts,",
                    style:TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2
                    )),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 200,width: 100,
                        child: Card(
                          color: Colors.blue,
                          child: homeController.make_button(
                            icon_name: MwIcons.add,
                            text: "",function: (){homeController.add_account(context);},),),
                      ),
                      homeController.render_account_cards(appController.userList),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text("Services",
                    style:TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: homeController.make_square_button_with_png(path: "others/svgtopng/desludging icon.png",
                          function: (){Get.to(DesludgingServicePage());},text: "Desludging service"),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: homeController.make_square_button(icon_name: MwIcons.water_tank_icon,
                          function: (){Get.to(WaterTankServicePage());},text: "Water Tank service"),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
               Row(
                  children: [
                    Expanded(
                      child: homeController.make_square_button(icon_name: MwIcons.sewer_icon,
                          function: (){Get.to(SewerServicePage());},text: "Sewer service"),
                    ),
                    SizedBox(width: 20,),
                    Expanded(child: homeController.make_square_button(icon_name: MwIcons.illegal_fee,function: (){Get.to(IllegalFeePage());}, text: "Illegal Fee")),
                  ],
                ),
              ],
            ),
          ),
        ),
      );}
  }

}
