import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._();
  static late SharedPreferences sharedPreferences;

  /// shared preferences instance 
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// save data in shared preferences using [key] and [value]
  static Future<void> setData(String key, value) async {
    await sharedPreferences.setString(key, value);
  }
  
  /// get data from shared preferences using [key]
  static Future getData(String key) async {
    return await sharedPreferences.getString(key);
  }

  /// remove data from shared preferences using [key]
  static Future<void> removeData(String key) async {
    await sharedPreferences.remove(key);
  }
}