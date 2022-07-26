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
      appBar: homeController.make_appBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back ${appController.current_account_data[1]},",style:TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3
              )),

              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 170,width: Get.width,
                  child: Center(
                    child: GradientCard(
                      gradient:g5,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          SizedBox(width: Get.width,),
                          Text("Your Balance",
                              style:TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 20,
                                  color: Colors.black,
                                  letterSpacing: 3
                              )
                          ),
                          SizedBox(height: 10,),
                          Text("Ksh .",
                              style:TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 20,
                                  color: Colors.black,
                                  letterSpacing: 3
                              )
                          ),
                          SizedBox(height: 10,),
                          Text("Last Payment is Ksh.",
                              style:TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  color: Colors.black,
                                  letterSpacing: 2
                              )
                          ),
                        ],
                      )),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    homeController.make_button_with_png(path: "others/svgtopng/pay-icon.png",function: (){Get.to(PayPage());},text: "Pay"),
                    homeController.make_button(icon_name: MwIcons.query_bill_icon,function: (){Get.to(QueryBillPage());}, text: "Query Bill"),
                    homeController.make_button(icon_name: MwIcons.illegal_fee,function: (){Get.to(IllegalFeePage());}, text: "Illegal Fee"),
                    homeController.make_button_with_png(path: "others/svgtopng/other-payments.png",function: (){Get.to(OtherPaymentsPage());},text: "Other\nPayments"),
                  ],
                ),
              ),
              Text("Transactions", style:TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  color: Colors.black,
                  letterSpacing: 2
              )),
            ],
          ),
        ),
      ),
    );
  }
}

