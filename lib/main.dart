import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/common_page.dart';
import 'package:mombasa_water/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends GetView {
    // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mombasa Water',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CommonPage(),
    );
  }
}

