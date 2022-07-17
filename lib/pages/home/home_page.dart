import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: makeDrawer(),
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20),
            Text("Your accounts "),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Text("Add account"),
                  ),),Card(child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Text("Add account"),
                  ),),Card(child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Text("Add account"),
                  ),)
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("Services"),
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

                ],
              ),
            ),


          ],
        ),
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
  Drawer makeDrawer()
  {
    return Drawer(
      child: SafeArea(
        child: Container(
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("My Account"),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text("Firstname Lastname"),leading: Icon(Icons.people),
                  trailing: ElevatedButton(child: Text("Switch Account"), onPressed: (){},),
                  ),
                ],
              ),
              Text("Support"),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(title: Text("Call Support"),leading: Icon(Icons.phone),),
                ListTile(title: Text("FAQ"),leading: Icon(Icons.book),),
                ListTile(title: Text("Mombasa Water Website"),leading: Icon(Icons.web),),
              ],
            ),
              Text("About"),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(title: Text("Terms and Conditions"),leading: Icon(Icons.list),),
                  ListTile(title: Text("Privacy Policy"),leading: Icon(Icons.book),),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
