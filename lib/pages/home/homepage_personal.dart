import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:gradient_ui_widgets/buttons/gradient_elevated_button.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart';
import 'package:mombasa_water/AppController/app_controller.dart';
import "package:mombasa_water/mw_icons_icons.dart";
import "package:mombasa_water/style/gradient_colors.dart";
import 'package:mombasa_water/pages/services/services_controller.dart';


class HomePagePersonal extends GetView {

  AppController appController = Get.find<AppController>();
  ServicesContoller servicesController = Get.put(ServicesContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: makeDrawer(),
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
                image: AssetImage("others/svgtopng/app-icon-login-removebg-preview 1.png")),

            SizedBox(height: 20),
            Text("Mombasa Water",
                style:TextStyle(
                    fontSize: 18,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3
                )

            ),
            Text("Welcome Back ${appController.current_user.value}"),
            Text("Water E-bill offers support for a number of accounts and is constantly expanding support for more"),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 200,width: 200,
                child: GradientCard(
                  gradient:g1,
                  child: Text("hi")),
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
                  make_button_with_png(path: "others/svgtopng/desludging icon.png",
                      function: (){servicesController.desludgingDialog(context);},text: "Desludging service"),
                  make_button(icon_name: MwIcons.water_tank_icon,
                      function: (){servicesController.tankServiceDialog(context);},text: "Water Tank service"),
                  make_button(icon_name: MwIcons.sewer_icon,
                      function: (){servicesController.sewerServiceDialog(context);},text: "Sewer service"),
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
    return GradientElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(100, 100),
        shape: const CircleBorder(),
      ),
      gradient: g1,
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
  Widget make_button_with_png({required String path,required Function function,required String text})
  {
    return GradientElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(100, 100),
        shape: const CircleBorder(),
      ),
      gradient: g1,
      child:Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(path,width: 50,height: 50,),
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
              Obx(()=> ListView(
                shrinkWrap: true,
                children: [
                  Card(
                    child: ListTile(
                      subtitle: Text(appController.current_user_data[0]),
                      title: Text(appController.current_user.value),leading:
                    Image.asset("others/svgtopng/user 1.png"),
                      trailing: GradientElevatedButton(
                        gradient: g1,
                        child: Text("Switch Account",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white
                          ),
                        ),
                        onPressed: (){switch_acc();},),
                    ),
                  ),
                ],
              ),
              ),
              Text("Support"),
              ListView(
                shrinkWrap: true,
                children: [
                  make_list_tile(text: "Call Support", icon_data: MwIcons.suport_icon),
                  make_list_tile(text: "FAQ", icon_data: MwIcons.faqs_icon),
                  make_list_tile(text: "Mombasa Water Website", icon_data: MwIcons.water_icon),
                ],
              ),
              Text("About"),
              ListView(
                shrinkWrap: true,
                children: [
                  make_list_tile(text: "Terms and Conditions", icon_data: MwIcons.terms_icon),
                  make_list_tile(text: "Privacy Policy", icon_data: MwIcons.privacy_policy),                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  // FUNCTIONS

  void add_account(BuildContext context)
  {
    final _formKey2 = GlobalKey<FormBuilderState>();
    // make get popup to activate acc
    RxString errorText = "".obs;
    Get.defaultDialog(title:"Add Water account",
      onCancel: (){Get.back();} ,
      content: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                SizedBox(height: 20,),
                Obx(
                      () => FormBuilder(
                    key: _formKey2,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'acc_no',
                          decoration: InputDecoration(
                              labelText: 'Enter Account number',
                              border: OutlineInputBorder(),
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
                        FormBuilderTextField(
                          name: 'names',
                          decoration: InputDecoration(
                              labelText: 'Enter Your Full name',
                              border: OutlineInputBorder(),
                              errorText: errorText.value.length > 0
                                  ? errorText.value
                                  : null),
                          onChanged: (String ?val) {
                            errorText.value = '';
                          },
                          // valueTransformer: (text) => num.tryParse(text),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                          ]),
                          keyboardType: TextInputType.text,
                        ),
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: InputDecoration(
                              labelText: 'Enter Phone number',
                              border: OutlineInputBorder(),
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

                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
      onConfirm: () async
      {
        if (_formKey2.currentState?.saveAndValidate() == true) {

          Map data = _formKey2.currentState!.value;
          print("the data is ${data}");
          // save data
          appController.add_user(data);
          Get.back();
        }
      },
    );
  }
  void switch_acc()
  {
    Get.defaultDialog(
        title: "Click to switch account",
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
                    title: Text(e),
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
  Widget render_account_cards(List userList)
  {
    return Obx(() => Row( children: userList.map((e) =>  Container(
      width: 250,
      height: 200,
      child:TextButton(
        child: GradientCard(
          gradient:g2,
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
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),),
                Text(" Ksh",style: TextStyle(
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
                      return Text("${e}\n${data[0]}",style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),);
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
