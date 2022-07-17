import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountsPage extends GetView {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: Text("My Profile"),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Center(
              child: Column(
                children: [
                SizedBox(height: 20),
                CircleAvatar(child: Icon(Icons.people,size: 150,),radius: 100,),
                Text("Firstname Lastname"),
                Text("Account number"),
                ],
              ),
            ),
          ]
      ),
    );
  }
}
