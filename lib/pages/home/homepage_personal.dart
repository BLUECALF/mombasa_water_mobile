import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart';
import 'package:mombasa_water/AppController/app_controller.dart';
import "package:mombasa_water/mw_icons_icons.dart";
import 'package:mombasa_water/pages/home/home_controller.dart';
import 'package:mombasa_water/pages/services/detailed_services/illegal_fee_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/other_payments_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/pay_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/query_bill_page.dart';
import "package:mombasa_water/style/gradient_colors.dart";
import 'package:mombasa_water/pages/services/services_controller.dart';


class HomePagePersonal extends GetView<HomeController>{

  AppController appController = Get.find<AppController>();
  ServicesContoller servicesController = Get.put(ServicesContoller());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey,
      drawer: homeController.makeDrawer(),
      endDrawer: homeController.makeEndDrawer(),
      appBar: homeController.make_appBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Mombasa Water",
                style:TextStyle(
                    fontSize: 18,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3
                )
            ),
            SizedBox(height: 20),
            Text("Welcome Back ${appController.current_user.value}",style:TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                letterSpacing: 3
            )),

            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 150,width: 300,
                child: GradientCard(
                  gradient:g5,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text("Your Balance",
                          style:TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3
                          )
                      ),
                      SizedBox(height: 20,),
                      Text("Ksh .",
                          style:TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3
                          )
                      ),
                      SizedBox(height: 20,),
                      Text("Last Payment is Ksh.",
                          style:TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w100,
                              letterSpacing: 3
                          )
                      ),
                    ],
                  )),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  homeController. make_button_with_png(path: "others/svgtopng/pay-icon.png",function: (){Get.to(PayPage());},text: "Pay"),
                  homeController.make_button(icon_name: MwIcons.query_bill_icon,function: (){Get.to(QueryBillPage());}, text: "Query Bill"),
                  homeController.make_button(icon_name: MwIcons.illegal_fee,function: (){Get.to(IllegalFeePage());}, text: "Illegal Fee"),
                  homeController.make_button_with_png(path: "others/svgtopng/other-payments.png",function: (){Get.to(OtherPaymentsPage());},text: "Other\nPayments"),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text("Transactions",style:TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                letterSpacing: 3
            )),
          ],
        ),
      ),
    );
  }
}

