import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/pages/services/services_controller.dart';

import '../../../style/hint_text_style.dart';

class QueryBillPage extends GetView {
  final _formKey2 = GlobalKey<FormBuilderState>();
  // make get popup to activate acc
  RxString errorText = "".obs;
  ServicesContoller servicesController = Get.find<ServicesContoller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: servicesController.make_appBar("Query Bill"),
      body: SingleChildScrollView(
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
                          name: 'acc_no',
                          decoration: InputDecoration(
                              hintText: 'Enter Account Number',
                              hintStyle: myHintStyle(),
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
                        Container(
                          width: Get.width,
                          child: ElevatedButton(
                            style: myButtonStyle(),
                            child: Text("Query Bill",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                            ),
                            onPressed: (){query();},),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),

    );
  }

  void query()
  {
    if(_formKey2.currentState?.saveAndValidate() == true) {
      Map data = _formKey2.currentState!.value;
      print("the data is ${data}");
      // save data
      Get.back();
    }
  }
}

