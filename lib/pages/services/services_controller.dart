import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ServicesContoller extends GetxController {
  // methods that services will use.
  //Dialogs
  //1 pay dialog
  void payDialog(BuildContext context)
  {
    final _formKey2 = GlobalKey<FormBuilderState>();
    // make get popup to activate acc
    RxString errorText = "".obs;
    Get.defaultDialog(title:"Pay",
      onCancel: (){Get.back();} ,
      content: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Obx(
                      () => FormBuilder(
                    key: _formKey2,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: InputDecoration(
                              labelText: 'Enter Phone Number',
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
                        SizedBox(height: 10,),
                        FormBuilderTextField(
                          name: 'amount',
                          decoration: InputDecoration(
                              labelText: 'Enter Amount',
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
                        SizedBox(height: 10,),
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
          Get.back();
        }
      },
    );
  }
  //2 query bill dialog

  //3 illegal Fee dialog
  void illegalFeeDialog(BuildContext context)
  {
    final _formKey2 = GlobalKey<FormBuilderState>();
    // make get popup to activate acc
    RxString errorText = "".obs;
    Get.defaultDialog(title:"Illegal Fee",
      onCancel: (){Get.back();} ,
      content: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Obx(
                      () => FormBuilder(
                    key: _formKey2,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: InputDecoration(
                              labelText: 'Enter Phone Number',
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
                        SizedBox(height: 10,),
                        FormBuilderTextField(
                          name: 'amount',
                          decoration: InputDecoration(
                              labelText: 'Enter Amount',
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
          Get.back();
        }
      },
    );
  }
  //4 other payments
  //5 desludging service
  void desludgingDialog(BuildContext context)
  {
    final _formKey2 = GlobalKey<FormBuilderState>();
    // make get popup to activate acc
    RxString errorText = "".obs;
    Get.defaultDialog(title:"Desludging Fee",
      onCancel: (){Get.back();} ,
      content: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Obx(
                      () => FormBuilder(
                    key: _formKey2,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'names',
                          decoration: InputDecoration(
                              labelText: 'Enter Customer Name',
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
                        SizedBox(height: 10,),
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: InputDecoration(
                              labelText: 'Enter Phone Number',
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
                        SizedBox(height: 10,),
                        FormBuilderTextField(
                          name: 'amount',
                          decoration: InputDecoration(
                              labelText: 'Enter Amount',
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
          Get.back();
        }
      },
    );
  }
  //6 water tank service
  void tankServiceDialog(BuildContext context)
  {
    final _formKey2 = GlobalKey<FormBuilderState>();
    // make get popup to activate acc
    RxString errorText = "".obs;
    Get.defaultDialog(title:"Water Tank Service",
      onCancel: (){Get.back();} ,
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(4.0),
            child: Column(
              children: [
                Obx(
                      () => FormBuilder(
                    key: _formKey2,
                    child: Column(
                      children: [
                        FormBuilderChoiceChip(
                          name: 'location',
                          selectedColor: Colors.blueAccent,
                          decoration: const InputDecoration(
                            labelText: 'Select the location',
                          ),
                          options: const [
                            FormBuilderFieldOption(value: 'Nyali', child: Text('Nyali')),
                            FormBuilderFieldOption(
                                value: 'Mazera', child: Text('Mazera')),
                          ],
                        ),
                        FormBuilderTextField(
                          name: 'names',
                          decoration: InputDecoration(
                              labelText: 'Enter Customer Name',
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
                        SizedBox(height: 5,),
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: InputDecoration(
                              labelText: 'Enter Phone Number',
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
                        SizedBox(height: 2,),
                        FormBuilderTextField(
                          name: 'amount',
                          decoration: InputDecoration(
                              labelText: 'Enter Amount',
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
          Get.back();
        }
      },
    );
  }
  //7 sewer service
  void sewerServiceDialog(BuildContext context)
  {
    final _formKey2 = GlobalKey<FormBuilderState>();
    // make get popup to activate acc
    RxString errorText = "".obs;
    Get.defaultDialog(title:"Sewer Service",
      onCancel: (){Get.back();} ,
      content: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Obx(
                      () => FormBuilder(
                    key: _formKey2,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: InputDecoration(
                              labelText: 'Enter Phone Number',
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
                        SizedBox(height: 10,),
                        FormBuilderTextField(
                          name: 'amount',
                          decoration: InputDecoration(
                              labelText: 'Enter Amount',
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
                        SizedBox(height: 10,),
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
          Get.back();
        }
      },
    );
  }
  //8 kiosk
  void kioskLICServiceDialog(BuildContext context)
  {
    final _formKey2 = GlobalKey<FormBuilderState>();
    // make get popup to activate acc
    RxString errorText = "".obs;
    Get.defaultDialog(title:"Kiosk LIC & Admin Fees",
      onCancel: (){Get.back();} ,
      content: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Obx(
                      () => FormBuilder(
                    key: _formKey2,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: InputDecoration(
                              labelText: 'Enter Phone Number',
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
                        SizedBox(height: 10,),
                        FormBuilderTextField(
                          name: 'amount',
                          decoration: InputDecoration(
                              labelText: 'Enter Amount',
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
                        SizedBox(height: 10,),
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
          Get.back();
        }
      },
    );
  }
  //9 new water lic
  void newLICBillDialog(BuildContext context)
  {
    final _formKey2 = GlobalKey<FormBuilderState>();
    // make get popup to activate acc
    RxString errorText = "".obs;
    Get.defaultDialog(title:"New LIC Water Bill",
      onCancel: (){Get.back();} ,
      content: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Obx(
                      () => FormBuilder(
                    key: _formKey2,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: InputDecoration(
                              labelText: 'Enter Phone Number',
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
                        SizedBox(height: 10,),
                        FormBuilderTextField(
                          name: 'amount',
                          decoration: InputDecoration(
                              labelText: 'Enter Amount',
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
                        SizedBox(height: 10,),
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
          Get.back();
        }
      },
    );
  }
}
