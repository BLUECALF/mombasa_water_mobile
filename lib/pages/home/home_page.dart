import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/AppController/app_controller.dart';


class HomePage extends GetView {

  AppController appController = Get.put(AppController());

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
                  Container(
                    height: 200,width: 200,
                    child: Card(child: Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: TextButton(child: Text("Add account"),onPressed: (){add_account(context);},),

                    ),),
                  ),
                  FutureBuilder(future: appController.get_user_list(),
                  builder: (context ,snapshot)
                    {
                      if(snapshot.data == null)
                        {
                          //do nothing
                        }
                      else
                        {
                          List<String> userList = snapshot.data as List<String>;
                          return Row( children: userList.map((e) =>  Container(
                            width: 250,
                            height: 200,
                            child: Card(child: Padding(
                              padding: const EdgeInsets.all(60.0),
                              child: Column(
                                children: [
                                  Text("Name: ${e}"),
                                  SizedBox(height: 10,),
                                  Text("Balance: Ksh"),
                                ],
                              ),
                            ),),
                          ),).toList());
                        }
                      return Text("No users");
                    }
                    ,
                  )
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
              Obx(()=> ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: Text(appController.current_user.value),leading: Icon(Icons.people),
                    trailing: ElevatedButton(child: Text("Switch Account"), onPressed: (){switch_acc();},),
                    ),
                  ],
                ),
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
}
