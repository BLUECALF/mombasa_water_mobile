import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

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
                make_button(icon_name: Icons.house,function: (){}, text: "pay"),
                make_button(icon_name: Icons.house,function: (){}, text: "Query Bill"),
                make_button(icon_name: Icons.house,function: (){}, text: "Illegal Fee"),
                make_button(icon_name: Icons.house,function: (){}, text: "Other Payments"),
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
                make_button(icon_name: Icons.house,function: (){},text: "Desludging service"),
                make_button(icon_name: Icons.house,function: (){},text: "Water Tank service"),
                make_button(icon_name: Icons.house,function: (){},text: "Sewer service"),
                make_button(icon_name: Icons.house,function: (){},text: "Kiosk Lic.& Admin Fee"),
                make_button(icon_name: Icons.house,function: (){},text: "New Water LIC Fees"),

              ],
            ),
          ),


        ],
      ),
    );
  }

  Widget make_button({required IconData icon_name,required Function function,required String text})
  {
    return ElevatedButton(
         child:Padding(
        padding: const EdgeInsets.all(5.0),
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
