import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/mw_icons_icons.dart';
import 'package:mombasa_water/pages/services/services_controller.dart';

class SearchPage extends GetView {
  final _formKey2 = GlobalKey<FormBuilderState>();
  // make get popup to activate acc
  RxString errorText = "".obs;
  ServicesContoller servicesController = Get.find<ServicesContoller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: servicesController.make_appBar("Search Page"),
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
                        IconButton(
                          icon: Icon(MwIcons.search),
                          onPressed: (){
                            showSearch(context: context, delegate: MySearchDelegate());
                          },
                        ),
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

                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate
{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: (){
            if(query.isEmpty)
              {
                close(context, null);
              }
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){Get.back();}, icon: Icon(MwIcons.back_icon));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      child: Text("Hi build results"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container(
      child: Text("Hi suggestions"),
    );
  }
}

