import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/AppController/app_controller.dart';
import 'package:mombasa_water/pages/common_page_controller.dart';
import 'package:mombasa_water/tab_bar_material_widget.dart';
import 'pages/accounts/accounts_page.dart';
import 'pages/home/home_page.dart';
import 'pages/services/services_page.dart';
class CommonPage extends GetView {
 AppController appController = Get.put(AppController());
 CommonPageController commonPageController = Get.put(CommonPageController());
 final screens = [
   HomePage(),
   ServicesPage(),
   AccountsPage()
 ];

  @override
  Widget build(BuildContext context) {
    appController.initialize_account();
    return Obx(()=>Scaffold(
        body: screens[commonPageController.selected_index.value],
        bottomNavigationBar: TabBarMaterialWidget()
        // NavigationBarTheme(
      //           data:  NavigationBarThemeData(
      //             height: 60,
      //             indicatorColor: Colors.blue,
      //             labelTextStyle: MaterialStateProperty.all(TextStyle(fontWeight: FontWeight.w400,fontSize: 16)),
      //
      //           ),
      //           child: NavigationBar(
      //             selectedIndex: selected_index.value,
      //             onDestinationSelected: (index) => selected_index.value = index,
      //             destinations: [
      //               NavigationDestination(icon: Image.asset("others/svgtopng/home-icon.png",color: Colors.black38,), label: "Home"),
      //               NavigationDestination(icon: Icon(MwIcons.services_icon), label: "Services"),
      //               NavigationDestination(icon: Image.asset("others/svgtopng/add-acc icon.png",color: Colors.black38,), label: "Accounts"),
      //             ],
      //           ),
      //         ),
      ),
    );
  }
}
