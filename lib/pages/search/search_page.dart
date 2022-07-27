import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/mw_icons_icons.dart';
import 'package:mombasa_water/pages/accounts/accounts_page.dart';
import 'package:mombasa_water/pages/drawer_pages/left_drawer_contents.dart';
import 'package:mombasa_water/pages/services/detailed_services/desludging_service_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/illegal_fee_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/kiosk_service_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/new_water_service_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/other_payments_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/pay_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/query_bill_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/sewer_service_page.dart';
import 'package:mombasa_water/pages/services/detailed_services/water_tank_service_page.dart';
import 'package:mombasa_water/pages/services/services_controller.dart';
import 'package:mombasa_water/style/hint_text_style.dart';

class SearchPage extends GetView {
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
                ElevatedButton(
                  style: myButtonStyle(),
                  child: Row(
                    children: [
                      Icon(MwIcons.search),
                      Text("Click To Search",style: myHintStyle())
                    ],
                  ),
                  onPressed: (){
                    showSearch(context: context, delegate: MySearchDelegate());
                  },
                ),
              ],
            )),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate
{
  List<String> searchResults = [
    "pay",
    "query bill",
    "illegal fee",
    "other payments",
    "desludging service",
    "water tank service",
    "sewer service",
    "kiosk lic & admin fee",
    "new water lic fees",
    "help & support",
    "share",
    "tell your friend",
    "delete account",
    "logout",
    "switch account",
    "faq",
    "mombasa water website",
    "terms and conditions",
    "privacy policy"
  ];

  Map result_and_location =
  {
    "pay":PayPage(),
    "query bill":QueryBillPage(),
    "illegal fee":IllegalFeePage(),
    "other payments": OtherPaymentsPage(),
    "desludging service":DesludgingServicePage(),
    "water tank service":WaterTankServicePage(),
    "sewer service":SewerServicePage(),
    "kiosk lic & admin fee":KioskServicePage(),
    "new water lic fees":NewWaterServicePage(),
    "help & support":AccountsPage(),
    "share":AccountsPage(),
    "tell your friend":AccountsPage(),
    "delete account":AccountsPage(),
    "logout":AccountsPage(),
    "switch account":LeftDrawer(),
    "faq":LeftDrawer(),
    "mombasa water website":LeftDrawer(),
    "terms and conditions":LeftDrawer(),
    "privacy policy":LeftDrawer()

  };

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
    return Center(
      child: Text(query,
      style: const TextStyle(fontFamily: "Poppins"),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  List<String> suggestions = searchResults.where((searchResults)
  {
    final result = searchResults.toLowerCase();
    final input = query.toLowerCase();

    return result.contains(input);
  }

  ).toList();    //
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context,index)
    {
      final suggestion = suggestions[index];

      return ListTile(
        title: Text(suggestion,style: TextStyle(fontFamily: "Poppins"),),
        onTap: ()
        {
          query = suggestion;
         Get.to(result_and_location[query]);
        },
      );
    }
    );
  }
}

