import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/mw_icons_icons.dart';
import 'package:mombasa_water/pages/search/search_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/desludging_service_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/illegal_fee_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/kiosk_service_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/new_water_service_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/other_payments_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/pay_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/query_bill_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/sewer_service_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/water_tank_service_page.dart';
import 'package:mombasa_water/pages/services/services_controller.dart';
import 'package:mombasa_water/style/colors.dart';


class ServicesPage extends GetView<ServicesContoller>{
  ServicesContoller servicesController = Get.find<ServicesContoller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title:Text("Services", style:TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 3
        ),),
         actions:[
           TextButton.icon(icon:Icon(MwIcons.search,color: Colors.black),
              onPressed: (){Get.to(SearchPage());},label: Text(""),),
         ],
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text("Pay Bill",
                  style:TextStyle(
                      fontFamily: "Poppins",
                  fontSize: 13,
                  color: Colors.black,
                  letterSpacing: 2)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    make_button_with_png(path: "others/svgtopng/pay-icon.png",function: (){Get.to(PayPage());},text: "Pay"),
                    make_button(icon_name: MwIcons.query_bill_icon,function: (){Get.to(QueryBillPage());}, text: "Query Bill"),
                    make_button(icon_name: MwIcons.illegal_fee,function: (){Get.to(IllegalFeePage());}, text: "Illegal Fee"),
                    make_button_with_png(path: "others/svgtopng/other-payments.png",function: (){Get.to(OtherPaymentsPage());},text: "Other\nPayments"),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("Fee Payment",
                style:TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    color: Colors.black,
                    letterSpacing: 2)),

                Row(
                  children: [
                  Expanded(
                    child: make_button_with_png(path: "others/svgtopng/desludging icon.png",
                        function: (){Get.to(DesludgingServicePage());},text: "Desludging service"),
                  ),
                  Expanded(
                    child: make_button(icon_name: MwIcons.water_tank_icon,
                        function: (){Get.to(WaterTankServicePage());},text: "Water Tank service"),
                  ),
                  Expanded(
                    child: make_button(icon_name: MwIcons.sewer_icon,
                        function: (){Get.to(SewerServicePage());},text: "Sewer service"),
                  ),
                ],
              ),
              Row(
                children: [
                  make_button_with_png(path: "others/svgtopng/kiosk-icon.png",
                      function: (){Get.to(KioskServicePage());},text: "Kiosk Lic & Admin Fee"),
                  make_button_with_png(path: "others/svgtopng/lic fee-icon.png",
                      function: (){Get.to(NewWaterServicePage());},text: "New Water LIC fees"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget make_button({required IconData icon_name,required Function function,required String text})
  {
    return TextButton(

      child:Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 60,
                  width: 60,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: color_blue_light),
                  child: Icon(icon_name,size: 50,color: Colors.white,)),
              Text("$text",textAlign: TextAlign.center,style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                color: Colors.black,
              ),),
            ]
        ),
      ),
      onPressed:(){function();}
      ,
    );
  }
  Widget make_button_with_png({required String path,required Function function,required String text})
  {
    return TextButton(

      child:Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 60,width: 60,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: color_blue_light),
                  child: Image.asset(path,width: 50,height: 50,)
              ),
              Text("$text",textAlign: TextAlign.center,style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                color: Colors.black,
              ),),
            ]
        ),
      ),
      onPressed:(){function();}
      ,
    );
  }
}
