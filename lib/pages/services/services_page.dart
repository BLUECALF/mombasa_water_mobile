import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:gradient_ui_widgets/buttons/gradient_elevated_button.dart';
import 'package:mombasa_water/mw_icons_icons.dart';

import '../../style/gradient_colors.dart';

class ServicesPage extends GetView {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: Text("Services"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(200,20)
          )
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
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
                make_button(icon_name: MwIcons.pay_icon,function: (){}, text: "Pay"),
                make_button(icon_name: MwIcons.query_bill_icon,function: (){}, text: "Query Bill"),
                make_button(icon_name: MwIcons.illegal_fee,function: (){}, text: "Illegal Fee"),
                make_button(icon_name: MwIcons.other_payments,function: (){}, text: "Other\nPayments"),
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
                make_button(icon_name: MwIcons.desludging_icon,function: (){},text: "Desludging service"),
                make_button(icon_name: MwIcons.water_tank_icon,function: (){},text: "Water Tank service"),
                make_button(icon_name: MwIcons.sewer_icon,function: (){},text: "Sewer service"),
                make_button(icon_name: MwIcons.kiosk_icon,function: (){},text: "Kiosk Lic.& Admin Fee"),
                make_button(icon_name: MwIcons.lic_fee_icon,function: (){},text: "New Water LIC Fees"),

              ],
            ),
          ),


        ],
      ),
    );
  }

  Widget make_button({required IconData icon_name,required Function function,required String text})
  {
    return GradientElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 200),
        shape: const CircleBorder(),
      ),
      gradient: g1,
         child:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon_name,size: 50,),
              Text("$text",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),),
            ]
        ),
      ),
      onPressed:(){function();}
      ,
    );
  }
}
