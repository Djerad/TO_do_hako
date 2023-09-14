import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
   late SharedPreferences sharedPreferences;

   init() async {
     sharedPreferences = await SharedPreferences.getInstance();
  }

  dynamic getdata({required String key}) {
    return sharedPreferences.get(key);
  }

  String? getdataString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

   Future<bool> savedata(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    }

    // Handle unexpected data types here, for example:
    throw ArgumentError('Unsupported data type for value');
  }
}
