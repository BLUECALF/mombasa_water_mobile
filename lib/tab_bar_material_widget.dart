import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/style/colors.dart';
import 'package:mombasa_water/style/hint_text_style.dart';

import 'pages/common_page_controller.dart';

class TabBarMaterialWidget extends GetView {
  CommonPageController commonPageController = Get.find<CommonPageController>();
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 120,
        child: Column(
          children: [
            SizedBox(width: Get.width,height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildTabItem_png(index: 0, path: "others/svgtopng/home-icon.png", label: "Home"),
                BuildTabItem_png(index: 1, path: "others/svgtopng/services-icon.png", label: "Services"),
                BuildTabItem_png(index: 2, path: "others/svgtopng/user 1.png", label: "Accounts"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildTabItem({required int index, required IconData icondata, required String label})
  {
    if(commonPageController.selected_index.value == index)
      {
        //you have been selected
        return ElevatedButton(
          style: myButtonStyle(),
          onPressed: (){
            commonPageController.selected_index.value = index;
          },
          child: Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icondata,color: Colors.white,),
                Text(label,
                style: TextStyle(
                  color: Colors.white
                ),
                )
              ],
            ),
          ),
        );
      }
    else
      {
       return TextButton(
          onPressed: (){
            commonPageController.selected_index.value = index;
          },
          child: Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icondata,color: Colors.black,),
                Text(label,
                  style: TextStyle(
                      color: Colors.black
                  ),
                )
              ],
            ),
          ),
        );

      }

  }

  Widget BuildTabItem_png({required int index, required String path, required String label})
  {
    if(commonPageController.selected_index.value == index)
    {
      //you have been selected
      return Container(
        height: 80,width: 80,
        decoration: BoxDecoration(
            color: color_blue_dark,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: TextButton(
          onPressed: (){
            commonPageController.selected_index.value = index;
          },
          child: Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(path,color: Colors.white,),
                Text(label,
                  style: TextStyle(
                      color: Colors.white
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    else
    {
      return TextButton(
        onPressed: (){
          commonPageController.selected_index.value = index;
        },
        child: Container(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(path,color: Colors.black,),
              Text(label,
                style: TextStyle(
                    color: Colors.black
                ),
              )
            ],
          ),
        ),
      );

    }
  }
}
