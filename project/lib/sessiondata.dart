import 'package:shared_preferences/shared_preferences.dart';

class Sessiondata {
  static bool? isLogin;
  static String? emailId;

  static Future<void> storeSessionData(
      {required bool loginData, required String emailId}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    //SET DATA
    sharedPreferences.setBool("loginSession", loginData);
    sharedPreferences.setString("email", emailId);

    //GET DATA
    await getSessionData();
  }

  static Future<void> getSessionData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    isLogin = sharedPreferences.getBool("loginSession") ?? false;
    emailId = sharedPreferences.getString("email") ?? "";
  }
}

