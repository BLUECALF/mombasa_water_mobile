import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/pages/services/services_controller.dart';

class WaterTankServicePage extends GetView {
  final _formKey2 = GlobalKey<FormBuilderState>();
  // make get popup to activate acc
  RxString errorText = "".obs;
  ServicesContoller servicesController = Get.find<ServicesContoller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: servicesController.make_appBar("Water Tank Service"),
      body:  SingleChildScrollView(
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
                          validator: FormBuilderValidators.required(context),
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
                        Container(
                          width: Get.width,
                          child: ElevatedButton(
                            child: Text("Pay",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                            ),
                            onPressed: (){pay();},),
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

  void pay()
  {
    if(_formKey2.currentState?.saveAndValidate() == true) {
      Map data = _formKey2.currentState!.value;
      print("the data is ${data}");
      // save data
      Get.back();
    }
  }
}

