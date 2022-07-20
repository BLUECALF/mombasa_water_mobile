import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/accounts/accounts_page.dart';
import 'pages/home/home_page.dart';
import 'pages/services/services_page.dart';
import "package:mombasa_water/mw_icons_icons.dart";
class CommonPage extends GetView {
 var selected_index = 0.obs;

 final screens = [
   HomePage(),
   ServicesPage(),
   AccountsPage()
 ];

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
        body: screens[selected_index.value],
        bottomNavigationBar: NavigationBarTheme(
          data:  NavigationBarThemeData(
            height: 60,
            indicatorColor: Colors.blue.shade200,
            labelTextStyle: MaterialStateProperty.all(TextStyle(fontWeight: FontWeight.w400,fontSize: 16)),
            backgroundColor: Colors.lightBlueAccent,
          ),
          child: NavigationBar(
            selectedIndex: selected_index.value,
            onDestinationSelected: (index) => selected_index.value = index,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
              NavigationDestination(icon: Icon(MwIcons.services_icon), label: "Services"),
              NavigationDestination(icon: Icon(Icons.people_outlined), label: "Accounts"),
            ],
          ),
        ),
      ),
    );
  }
}
