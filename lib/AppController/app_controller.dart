import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {

  RxList<String> accountList = [""].obs;
  var current_account = "".obs;
  List<String> current_account_data = [];


  Future<SharedPreferences> getStorage() async
  {
    var store = await SharedPreferences.getInstance();
    return store;
  }

  void add_account(Map data) async
  {
    accountList.value = (await get_account_list())!;
    String names = "John Doe";
    String acc_no = data["acc_no"];
    String phone = "911";

    List<String> accountdata = [acc_no,names,phone];
    print("user data is ${accountdata}");
    // adduser to user list
    accountList.add(acc_no);
    print("user list is ${accountList}");
    final prefs = await SharedPreferences.getInstance();
    // insert users data to storage
    prefs.setStringList(acc_no, accountdata);

    // update users list
    prefs.setStringList("accounts", accountList.value);
  }
  Future<List<String>?> get_account_data(String acc_no) async
  {
    final prefs = await SharedPreferences.getInstance();
    // insert users data to storage
    return prefs.getStringList(acc_no);
  }

  Future<List<String>?> get_account_list() async
  {
    final prefs = await SharedPreferences.getInstance();
    // insert users data to storage
    var l = prefs.getStringList("accounts");
    if(l == null)
    {
      print("accountlist is null");
      l = [];
    }
    return l;
  }
  void initialize_account() async
  {
    List<String>? accountlist = await get_account_list();
    if(accountlist?.length != 0)
      {
        //has users
        accountList.value = accountlist!;
        current_account.value = accountlist[0];
        current_account_data = (await get_account_data(current_account.value))!;
      }
    else
      {
        current_account.value = "NO account";
        current_account_data = ["NO account","No Name","no phone"];
      }
  }
  void delete_acc(String acc_no) async
  {
    accountList.remove(acc_no);
  print("account list is ${accountList}");
  final prefs = await SharedPreferences.getInstance();
  // insert users data to storage
  prefs.remove(acc_no);
  prefs.setStringList("accounts", accountList);
  }
  bool isFirstTime()
  {
    if((accountList.value.length ==1 && accountList.value[0]=="") ||(accountList.value.length ==0 && current_account.value =="NO account"))
      {
        // first time
        return true;
      }
    else
    {return false;}
  }
  bool isCurrentAccountSelected()
  {
    if(accountList.value.length > 0 && current_account.value !="NO account")
    {
      // current user is well selected.
      return true;
    }
    else
    {return false;}
  }
  void logout()
  {
    current_account.value = "NO account";
    current_account_data = ["NO account","No Name","no phone"];
  }
}
