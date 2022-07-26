import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/AppController/app_controller.dart';
import 'package:mombasa_water/mw_icons_icons.dart';
import 'package:mombasa_water/pages/common_page_controller.dart';

class AccountsPage extends GetView {
  AppController appController = Get.find<AppController>();
  CommonPageController commonPageController = Get.find<CommonPageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile",
            style:TextStyle(
                fontFamily: "Poppins",
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
                CircleAvatar(child: Image.asset("others/svgtopng/user 1.png",color: Colors.white,),radius: 60,),
                  SizedBox(height: 10),
                Text("${appController.current_user.value}",style:TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3
                )),
                  SizedBox(height: 10),
                Text("Account Number",
                    style:TextStyle(
                        fontFamily: "Poppins",
                    fontSize: 14,
                    color: Colors.black26,
                    letterSpacing: 2
                )),
                  SizedBox(height: 15),
                Text("${appController.current_user_data[0]}",
                    style:TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3
                    )),
                  SizedBox(height: 20),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      make_list_tile(text: "Help & Support", icon_data: MwIcons.suport_icon),
                      make_list_tile(text: "Tell Your Friend", icon_data: Icons.share),
                      make_list_tile(text: "Delete Account", icon_data: MwIcons.trash_icon),
                      Divider(color: Colors.blue,),
                      TextButton(child: make_logout_tile(),
                      onPressed: (){
                        appController.logout();
                        commonPageController.selected_index.value = 0;
                        },),

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
    return ListTile(
        title: Text(text,
        style:TextStyle(
          fontFamily: "Poppins",
        )
        ),leading: Container(
        padding: EdgeInsets.all(15),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue
        ),
        child: Icon(icon_data,color: Colors.white))
    );
  }
  Widget make_logout_tile()
  {
    return  ListTile(
        title: Text("Logout",
            style:TextStyle(
              color: Colors.blue,
              fontFamily: "Poppins",
            )
        ),leading: Container(
      padding: EdgeInsets.all(2),
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue
      ),
      child: Container(
          padding: EdgeInsets.all(15),
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white
          ),
          child: Icon(Icons.power_settings_new,color: Colors.blue)),
    )
    );
  }
}
