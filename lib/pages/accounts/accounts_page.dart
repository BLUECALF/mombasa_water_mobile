import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/AppController/app_controller.dart';
import 'package:mombasa_water/mw_icons_icons.dart';

class AccountsPage extends GetView {
  AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile",
            style:TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
        )),
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Center(
              child: Column(
                children: [
                SizedBox(height: 20),
                CircleAvatar(child: Image.asset("others/svgtopng/user 1.png",color: Colors.white,),radius: 60,),
                  SizedBox(height: 20),
                Text("${appController.current_user.value}",style:TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3
                )),
                  SizedBox(height: 20),
                Text("Account Number",
                    style:TextStyle(
                    fontSize: 18,
                    color: Colors.black26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2
                )),
                  SizedBox(height: 15),
                Text("${appController.current_user_data[0]}",
                    style:TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2
                    )),
                  SizedBox(height: 30),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      make_list_tile(text: "Help & Support", icon_data: MwIcons.suport_icon),
                      make_list_tile(text: "Tell Your Friend", icon_data: Icons.share),
                      make_list_tile(text: "Delete Account", icon_data: MwIcons.trash_icon),
                      Divider(color: Colors.blue,),
                      TextButton(child: make_list_tile(text: "Logout", icon_data: Icons.power_settings_new,),
                        onPressed: (){appController.logout(); Get.back();},),
                    ],
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
  Widget make_list_tile({required String text,required IconData icon_data})
  {
    return Card(
      child: ListTile(
          title: Text(text),leading: Container(
          padding: EdgeInsets.all(15),
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue
          ),
          child: Icon(icon_data,color: Colors.white))
      ),
    );
  }
}
