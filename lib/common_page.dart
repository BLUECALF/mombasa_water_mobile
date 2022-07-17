import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/accounts/accounts_page.dart';
import 'pages/home/home_page.dart';
import 'pages/services/services_page.dart';

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
        body: Center(child: Text("Common paage")),
        bottomNavigationBar: NavigationBarTheme(
          data:  NavigationBarThemeData(
            indicatorColor: Colors.blue.shade200,
            labelTextStyle: MaterialStateProperty.all(TextStyle(fontWeight: FontWeight.w400,fontSize: 16)),
            backgroundColor: Colors.lightBlueAccent,
          ),
          child: NavigationBar(
            selectedIndex: selected_index.value,
            onDestinationSelected: (index) => selected_index.value = index,
            destinations: [
              NavigationDestination(icon: Icon(Icons.house), label: "Home"),
              NavigationDestination(icon: Icon(Icons.mail), label: "Services"),
              NavigationDestination(icon: Icon(Icons.people), label: "Accounts"),
            ],
          ),
        ),
      ),
    );
  }
}
