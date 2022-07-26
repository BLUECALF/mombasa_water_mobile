import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mombasa_water/AppController/app_controller.dart';
import 'package:mombasa_water/mw_icons_icons.dart';
import 'package:mombasa_water/pages/drawer_pages/left_drawer_contents.dart';
import 'package:mombasa_water/pages/drawer_pages/notification_page.dart';
import 'package:mombasa_water/pages/search/search_page.dart';
import 'package:mombasa_water/style/colors.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  AppController appController = Get.find<AppController>();



  /// USED FUNCTIONS FOR WIDGETS
AppBar make_appBar()
{
  return AppBar(
    leading: TextButton.icon(icon:Icon(MwIcons.nav_menu,color: Colors.black),
      onPressed: (){Get.to(LeftDrawer());},label: Text(""),),
    toolbarHeight: 70,
    title: Column(
      children: [
        Image(
                image: AssetImage("others/svgtopng/app-icon-login-removebg-preview 1.png")),
        SizedBox(height: 10),
        Text("Mombasa Water",
            style:TextStyle(
                fontSize: 15,
                color: color_blue_light,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
            )
        ),
      ],
    ),
    actions:[
        TextButton.icon(icon:Icon(MwIcons.search,color: Colors.black),
          onPressed: (){Get.to(SearchPage());},label: Text(""),),
        TextButton.icon(icon:Icon(MwIcons.notification_icon,color: Colors.black),
          onPressed: (){Get.to(NotificationPage());},label: Text(""),),
      ],

    centerTitle: true,
    backgroundColor: Colors.white,
    shadowColor: Colors.transparent,
  );
}

  Widget make_button({required IconData icon_name,required Function function,required String text})
  {
    return TextButton(

      child:Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                  width: 60,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: color_blue_light),
                  child: Icon(icon_name,size: 50,color: Colors.white,)),
              Text("$text",textAlign: TextAlign.center,style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                color: Colors.black,
              ),),
            ]
        ),
      ),
      onPressed:(){function();}
      ,
    );
  }

  Widget make_square_button({required IconData icon_name,required Function function,required String text})
  {
    return ElevatedButton(
       style: ElevatedButton.styleFrom(
            primary: color_blue_excess_light
        ),
      child:Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon_name,size: 50,color: Colors.white,),
              Text("$text",textAlign: TextAlign.center,style: TextStyle(
                fontFamily: "Poppins",
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

  Widget make_button_with_png({required String path,required Function function,required String text})
  {
    return TextButton(

      child:Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,width: 60,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: color_blue_light),
                  child: Image.asset(path,width: 50,height: 50,)
              ),
              Text("$text",textAlign: TextAlign.center,style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                color: Colors.black,
              ),),
            ]
        ),
      ),
      onPressed:(){function();}
      ,
    );
  }

  Widget make_square_button_with_png({required String path,required Function function,required String text})
  {
    return ElevatedButton(
      style:ElevatedButton.styleFrom(
          primary: color_blue_excess_light
      ),
      child:Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(path,width: 50,height: 50,),
              Text("$text",textAlign: TextAlign.center,style: TextStyle(
                fontFamily: "Poppins",
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

// FUNCTIONS

  void add_account(BuildContext context)
  {
    final _formKey2 = GlobalKey<FormBuilderState>();
    // make get popup to activate acc
    RxString errorText = "".obs;
    Get.defaultDialog(
      title:"Add Account" ,titleStyle: TextStyle(fontFamily: "Poppins",),
      content: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Obx(
                      () => FormBuilder(
                    key: _formKey2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Account Number",
                        style: TextStyle(fontFamily: "Poppins",)),
                        SizedBox(height: 15,),
                        FormBuilderTextField(
                          name: 'acc_no',
                          decoration: InputDecoration(
                            hintText: "Enter Account No.",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              errorText: errorText.value.length > 0
                                  ? errorText.value
                                  : null),
                          onChanged: (String ?val) {
                            errorText.value = '';
                          },
                          // valueTransformer: (text) => num.tryParse(text),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context)
                          ]),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: Get.width,
                          child: ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                  primary: color_blue_dark
                              ),
                              onPressed: (){login(_formKey2);}, child: Text("Login",
                          style:TextStyle(fontFamily: "Poppins",))
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children:[
                        Expanded(child: Text("Don't have an account ?",
                        style:TextStyle(fontFamily: "Poppins",
                        fontSize: 13,
                        ))),TextButton(onPressed: (){}, child: Text("Register",style: TextStyle(
                            color: color_blue_light,
                            fontFamily: "Poppins",),))]),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
  void login(var _formKey2) async
  {
    if (_formKey2.currentState?.saveAndValidate() == true) {

      Map data = _formKey2.currentState!.value;
      print("the data is ${data}");
      // save data
      appController.add_user(data);
      Get.back();
    }
  }
  void switch_acc()
  {
    Get.defaultDialog(
        title: "Click to switch account", titleStyle: TextStyle(fontFamily: "Poppins",),
        content: FutureBuilder(future: appController.get_user_list(),
          builder: (context ,snapshot)
          {
            if(snapshot.data == null)
            {
              //do nothing
            }
            else
            {
              List<String> userList = snapshot.data as List<String>;
              return Container(
                height: 400,
                child: ListView(children: userList.map((e) => Card(
                  child: ListTile(
                    leading: Icon(Icons.people),
                    title: Text(e,style: TextStyle(fontFamily: "Poppins",),),
                    onTap: () async
                    {
                      appController.current_user.value = e;
                      appController.current_user_data = (await appController.get_user_data(e))!;
                      Get.back();
                    },

                  ),
                )).toList(),),
              );

            }
            return Text("No Accounts");
          }
          ,
        )
    );
  }
  Widget make_list_tile({required String text,required IconData icon_data})
  {
    return ListTile(
        title: Text(text,style: TextStyle(fontFamily: "Poppins",),),leading: Container(
        padding: EdgeInsets.all(15),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: color_blue_light
        ),
        child: Icon(icon_data,color: Colors.white))
    );
  }
  Widget render_account_cards(List userList)
  {
    return Obx(() => Row( children: userList.map((e) =>  Container(
      width: 250,
      height: 225,
      child:TextButton(
        child: Card(
          color: color_blue_dark,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(MwIcons.trash_icon,color: Colors.white,size: 20),
                      onPressed: () {
                        appController.delete_acc(e);
                      },
                    ),
                  ],
                ),
                Text("Current Balance",style: TextStyle(
                  fontFamily: "Poppins",
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),),
                Text(" Ksh",style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                SizedBox(height: 15,),
                FutureBuilder(future: appController.get_user_data(e),
                  builder: (context,snapshot)
                  {
                    List<String>? data = snapshot.data as List<String>?;
                    if(data == null || data.length ==0)
                    { return Text("No Account");}
                    else{
                      return Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${e}",maxLines: 1,style: TextStyle(
                              fontFamily: "Poppins",
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),),
                            Expanded(
                              child: Text("${data[0]}",style: TextStyle(
                                fontFamily: "Poppins",
                                letterSpacing: 4,
                                fontSize: 16,
                                color: Colors.white,
                              ),),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),),onPressed: () async{
        appController.current_user.value = e;
        appController.current_user_data = (await appController.get_user_data(e))!;
      },),
    ),).toList()),
    );
  }
}
