import 'dart:ui';
import 'package:it_venture_test/utils/shared_peferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoryManagement {
  static SharedPreferences? prefs;

  static Future<bool> init() async {
    prefs = await SharedPreferences?.getInstance();
    return true;
  }

  static void setAccessToken({required String accessToken}) {
    prefs!.setString(SharedPrefsKeys.ACCESS_TOKEN, accessToken);
  }

  static String getAccessToken() {
    return prefs!.getString(SharedPrefsKeys.ACCESS_TOKEN)!;
  }

  static void setAppBaseUrl({required String appBaseUrl}) {
    prefs!.setString(SharedPrefsKeys.APP_BASE_URL, appBaseUrl);
  }

  static String getAppBaseUrl() {
    return prefs!.getString(SharedPrefsKeys.APP_BASE_URL)!;
  }

  static void setNoImageUrl({required String noImageUrl}) {
    prefs!.setString(SharedPrefsKeys.NO_IMAGE_URL, noImageUrl);
  }

  static String getNoImageUrl() {
    return prefs!.getString(SharedPrefsKeys.NO_IMAGE_URL)!;
  }

  static void setUserId({required String userId}) {
    prefs!.setString(SharedPrefsKeys.USER_ID, userId);
  }

  static String getUserId() {
    return prefs!.getString(SharedPrefsKeys.USER_ID)!;
  }

  static void setDeviceId({required String deviceID}) {
    prefs!.setString(SharedPrefsKeys.DEVICE_ID, deviceID);
  }

  static String getDeviceId() {
    return prefs!.getString(SharedPrefsKeys.DEVICE_ID)!;
  }

  static void setUserInfo({required String userInfo}) {
    prefs!.setString(SharedPrefsKeys.USER_INFO, userInfo);
  }

  static String getUserInfo() {
    return prefs!.getString(SharedPrefsKeys.USER_INFO)!;
  }

  static void setUserLoationInfo({required String locationInfo}) {
    prefs!.setString(SharedPrefsKeys.LOATION_INFO, locationInfo);
  }

  static String getUserLocationInfo() {
    return prefs!.getString(SharedPrefsKeys.LOATION_INFO)!;
  }

  static void setUniqueId({required String unique_id}) {
    prefs!.setString(SharedPrefsKeys.UNIQUE_ID, unique_id);
  }

  static String getUniqueId() {
    return prefs!.getString(SharedPrefsKeys.UNIQUE_ID)!;
  }

  static void setUniqueIdStatus({required bool status}) {
    prefs!.setBool(SharedPrefsKeys.UNIQUE_ID_STATUS, status);
  }

  static bool getUniqueIdStatus() {
    return prefs!.getBool(SharedPrefsKeys.UNIQUE_ID_STATUS)!;
  }

  static void setLocationStatus({required bool status}) {
    prefs!.setBool(SharedPrefsKeys.LOCATION_SET_STATUS, status);
  }

  static bool getLocationStatus() {
    return prefs!.getBool(SharedPrefsKeys.LOCATION_SET_STATUS)!;
  }

  static void setLoginStatus({required bool status}) {
    prefs!.setBool(SharedPrefsKeys.LOGIN_STATUS, status);
  }

  static bool getLoginStatus() {
    return prefs!.getBool(SharedPrefsKeys.LOGIN_STATUS)!;
  }

  static void setOnboarding({required bool status}) {
    prefs!.setBool(SharedPrefsKeys.ONBOARDING_STATUS, status);
  }

  static bool getOnboarding() {
    return prefs!.getBool(SharedPrefsKeys.ONBOARDING_STATUS)!;
  }

  static Future<void> setScreenType({required String type}) async {
    prefs!.setString(SharedPrefsKeys.SCREEN_TYPE, type);
  }

  static String getScreenType() {
    return prefs!.getString(SharedPrefsKeys.SCREEN_TYPE)!;
  }

  static void socialMediaStatus(String value) {
    prefs!.setString(SharedPrefsKeys.USER_SOCIAL_STATUS, value);
  }

  static String getSocialMediaStatus() {
    return prefs!.getString(SharedPrefsKeys.USER_SOCIAL_STATUS)!;
  }

  static void setUserEmail(String value) {
    prefs!.setString(SharedPrefsKeys.USER_EMAIL, value);
  }

  static String getUserEmail() {
    return prefs!.getString(SharedPrefsKeys.USER_EMAIL)!;
  }

  static void setuserName({required String username}) {
    prefs!.setString(SharedPrefsKeys.NAME, username);
  }

  static String getuserName() {
    return prefs!.getString(SharedPrefsKeys.NAME)!;
  }

  static void setCountry({required String country}) {
    prefs!.setString(SharedPrefsKeys.COUNTRY, country);
  }

  static String getCountry() {
    return prefs!.getString(SharedPrefsKeys.COUNTRY)!;
  }

  //clear all values from shared preferences
  static void clearMemory() async {
    await prefs!.clear();
  }

  //for locale set and fetch things
  static changeLocale(Locale type) async {
    if (type == Locale("ar")) {
      await prefs!.setString(SharedPrefsKeys.LANGUAGE_CODE, 'ar');
      await prefs!.setString(SharedPrefsKeys.COUNTRY_CODE, '');
    } else {
      await prefs!.setString(SharedPrefsKeys.LANGUAGE_CODE, 'en');
      await prefs!.setString(SharedPrefsKeys.COUNTRY_CODE, 'US');
    }
  }

  static String fetchLocale() {
    return prefs!.getString(SharedPrefsKeys.LANGUAGE_CODE)!;
  }
}
