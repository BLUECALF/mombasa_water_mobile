import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {

  List<String> userList = [];
  var current_user = "".obs;
  List<String> current_user_data = [];


  Future<SharedPreferences> getStorage() async
  {
    var store = await SharedPreferences.getInstance();
    return store;
  }

  void add_user(Map data) async
  {
    userList = (await get_user_list())!;
    String names =data["names"];
    String acc_no = data["acc_no"];
    String phone = data["phone"];

    List<String> userdata = [acc_no,names,phone];
    print("user data is ${userdata}");
    // adduser to user list
    userList.add(names);
    print("user list is ${userList}");
    final prefs = await SharedPreferences.getInstance();
    // insert users data to storage
    prefs.setStringList(names, userdata);

    // update users list
    prefs.setStringList("users", userList);
  }
  Future<List<String>?> get_user_data(String names) async
  {
    final prefs = await SharedPreferences.getInstance();
    // insert users data to storage
    return prefs.getStringList(names);
  }

  Future<List<String>?> get_user_list() async
  {
    final prefs = await SharedPreferences.getInstance();
    // insert users data to storage
    var l = prefs.getStringList("users");
    if(l == null)
    {
      print("userlist is null");
      l = [];
    }
    return l;
  }

}
