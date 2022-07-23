import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_ui_widgets/buttons/gradient_elevated_button.dart';
import 'package:mombasa_water/mw_icons_icons.dart';
import 'package:mombasa_water/pages/services/services_controller.dart';

import '../../style/gradient_colors.dart';

class ServicesPage extends GetView<ServicesContoller>{
  ServicesContoller servicesController = Get.find<ServicesContoller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Services", style:TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 3
            )),
            TextButton.icon(icon:Icon(MwIcons.search,color: Colors.black),
              onPressed: (){},label: Text(""),),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 20),
          Text("Pay Bill"),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                make_button_with_png(path: "others/svgtopng/pay-icon.png",function: (){servicesController.payDialog(context);},text: "Pay"),
                make_button(icon_name: MwIcons.query_bill_icon,function: (){}, text: "Query Bill"),
                make_button(icon_name: MwIcons.illegal_fee,function: (){servicesController.illegalFeeDialog(context);}, text: "Illegal Fee"),
                make_button_with_png(path: "others/svgtopng/other-payments.png",function: (){},text: "Other\nPayments"),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text("Fee Payment"),
          SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: GridView.count(
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              crossAxisCount: 3,

              children: [
                make_button_with_png(path: "others/svgtopng/desludging icon.png",
                    function: (){servicesController.desludgingDialog(context);},text: "Desludging service"),
                make_button(icon_name: MwIcons.water_tank_icon,
                    function: (){servicesController.tankServiceDialog(context);},text: "Water Tank service"),
                make_button(icon_name: MwIcons.sewer_icon,
                    function: (){servicesController.sewerServiceDialog(context);},text: "Sewer service"),
                make_button_with_png(path: "others/svgtopng/kiosk-icon.png",
                    function: (){servicesController.kioskLICServiceDialog(context);},text: "Kiosk Lic & Admin Fee"),
                make_button_with_png(path: "others/svgtopng/lic fee-icon.png",
                    function: (){servicesController.newLICBillDialog(context);},text: "New Water LIC fees"),
              ],
            ),
          ),
        ],
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
                      color: Colors.blue),
                  child: Icon(icon_name,size: 50,color: Colors.white,)),
              Text("$text",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 14,
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
                      color: Colors.blue),
                  child: Image.asset(path,width: 50,height: 50,)
              ),
              Text("$text",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 14,
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
