import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper{
  static String key = "token";
  static SharedPreferences? prefs;

  static Future<SharedPreferences> get sharedPreferences  async{
    if(prefs == null)
      prefs = await SharedPreferences.getInstance();
    return prefs!;
  }
  static void setToken(String token) async {
    (await sharedPreferences).setString(key, token);
  }
  static Future<String> getToken() async{
    return  (await sharedPreferences).getString(key)!;
  }
  static Future<bool> isLogin() async{
    String token = (await sharedPreferences).getString(key)!;

    if(token.isEmpty || token == null){
      return false;
    }
    return  true;
  }
}