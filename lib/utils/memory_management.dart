import 'dart:ui';
import 'package:it_venture_test/utils/shared_peferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoryManagement {
  static SharedPreferences? prefs;

  static Future<bool> init() async {
    prefs = await SharedPreferences?.getInstance();
    return true;
  }

  static void setOnboarding({required bool status}) {
    prefs!.setBool(SharedPrefsKeys.ONBOARDING_STATUS, status);
  }

  static bool getOnboarding() {
    return prefs!.getBool(SharedPrefsKeys.ONBOARDING_STATUS)!;
  }

  static void setOffLineNews({required String value}) {
    prefs!.setString(SharedPrefsKeys.OFFLINE_NEWS, value);
  }

  static String getOffLineNews() {
    return prefs!.getString(SharedPrefsKeys.OFFLINE_NEWS)!;
  }
}
