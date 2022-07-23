import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart';
import 'package:mombasa_water/AppController/app_controller.dart';
import "package:mombasa_water/mw_icons_icons.dart";
import 'package:mombasa_water/pages/home/home_controller.dart';
import 'package:mombasa_water/pages/home/homepage_first_time.dart';
import 'package:mombasa_water/pages/home/homepage_personal.dart';
import "package:mombasa_water/style/gradient_colors.dart";
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
        drawer: homeController.makeDrawer(),
        endDrawer: homeController.makeEndDrawer(),
        appBar:homeController.make_appBar(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                  image: AssetImage("others/svgtopng/app-icon-login-removebg-preview 1.png")),

              SizedBox(height: 20),
              Text("Mombasa Water",
                  style:TextStyle(
                      fontSize: 18,
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3
                  )

              ),
              Text("Your accounts "),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 200,width: 150,
                      child: GradientCard(
                        gradient:g1,
                        child: homeController.make_button(
                          icon_name: MwIcons.add,
                          text: "Add account",function: (){homeController.add_account(context);},),),
                    ),
                    homeController.render_account_cards(appController.userList),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Services"),
              SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: GridView.count(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 3,

                  children: [
                    homeController.make_button_with_png(path: "others/svgtopng/desludging icon.png",
                        function: (){servicesController.desludgingDialog(context);},text: "Desludging service"),
                    homeController.make_button(icon_name: MwIcons.water_tank_icon,
                        function: (){servicesController.tankServiceDialog(context);},text: "Water Tank service"),
                    homeController.make_button(icon_name: MwIcons.sewer_icon,
                        function: (){servicesController.sewerServiceDialog(context);},text: "Sewer service"),
                  ],
                ),
              ),
            ],
          ),
        ),
      );}
  }

}
