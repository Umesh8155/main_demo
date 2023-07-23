import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String keyIsSecondTime = 'IsSecondTime';
const String keyCurrentLanguage = 'CurrentLanguage';
const String keyInstallDate = 'InstallDate';
const String keyFCMToken = 'FCMToken';
const String keyPlaceSaved = 'PlaceSaved';
const String keyIsCameSecondTime = 'IsCameSecondTime';

const String keyOldCityName = 'OldCityName';

const String keyCityName = 'CityName';
const String keyStateName = 'StateName';
const String keyCountryName = 'CountryName';
const String keyTimeZone = 'TimeZone';
const String keyLatitude = 'Latitude';
const String keyLongitude = 'Longitude';

const String keyDefaultCityName = 'DefaultCityName';
const String keyDefaultTimeZone = 'DefaultTimeZone';
const String keyDefaultLatitude = 'DefaultLatitude';
const String keyDefaultLongitude = 'DefaultLongitude';

const String keyLivePlaceDetail = 'LivePlaceDetail';
const String keyIsAskedLocation = 'IsAskedLocation';

const String keyAppLink = 'AppLink';
const String keyIOSAppLink = 'IOSAppLink';
const String keyCallGCMAPI = 'CallGCMAPI';
const String keyRatting = 'Ratting';
const String keyAnalyticsId = 'AnalyticsId';

const String keyIs12HourFormat = 'Is12HourFormat';
const String keyHourFormat = 'HourFormat';

//ads
const String keyShowBackScreen = 'ShowBackScreen';
const String keyShowAdAfterDays = 'ShowAdAfterDays';
const String keyCallAdAPIEverytime = 'CallAdAPIEverytime';
const String keyIsLocalAd = 'IsLocalAd';
const String keyAdvertiseSettingData = 'AdvertiseSettingData';
const String keyAdsShowStartTime = 'AdsShowStartTime';

const String keyOpenAdsAdmobId = 'OpenAdsAdmobId';
const String keyOpenAdsTypes = 'OpenAdsTypes';
const String keyOpenAdsActive = 'OpenAdsActive';

const String keyExitPointFullScreenAdmobId = 'ExitPointFullScreenAdmobId';
const String keyExitPointFullScreenFBId = 'ExitPointFullScreenFBId';
const String keyExitPointFullScreenTypes = 'ExitPointFullScreenTypes';
const String keyExitPointFullScreenActive = 'ExitPointFullScreenActive';
const String keyExitPointFullScreenClick = 'ExitPointFullScreenClick';
const String keyExitPointFullScreenImage = 'ExitPointFullScreenImage';
const String keyExitPointFullScreenUrl = 'ExitPointFullScreenUrl';
const String keyExitPointFullScreenAlternate = 'ExitPointFullScreenAlternate';
const String keyExitPointFullScreenSettingHour = 'ExitPointFullScreenSettingHour';

const String keyFullScreenAdmobId = 'FullScreenAdmobId';
const String keyFullScreenFBId = 'FullScreenFBId';
const String keyFullScreenTypes = 'FullScreenTypes';
const String keyFullScreenActive = 'FullScreenActive';
const String keyFullScreenClick = 'FullScreenClick';
const String keyFullScreenImage = 'FullScreenImage';
const String keyFullScreenUrl = 'FullScreenUrl';
const String keyFullScreenAlternate = 'FullScreenAlternate';
const String keyFullScreenSettingHour = 'FullScreenSettingHour';

const String keySplashFullScreenAdmobId = 'SplashFullScreenAdmobId';
const String keySplashFullScreenFBId = 'SplashFullScreenFBId';
const String keySplashFullScreenTypes = 'SplashFullScreenTypes';
const String keySplashFullScreenActive = 'SplashFullScreenActive';
const String keySplashFullScreenClick = 'SplashFullScreenClick';
const String keySplashFullScreenImage = 'SplashFullScreenImage';
const String keySplashFullScreenUrl = 'SplashFullScreenUrl';
const String keySplashFullScreenAlternate = 'SplashFullScreenAlternate';
const String keySplashFullScreenSettingHour = 'SplashFullScreenSettingHour';

const String keyHomeNativeAdmobId = 'HomeNativeAdmobId';
const String keyHomeNativeFBId = 'HomeNativeFBId';
const String keyHomeNativeTypes = 'HomeNativeTypes';
const String keyHomeNativeActive = 'HomeNativeActive';
const String keyHomeNativeImage = 'HomeNativeImage';
const String keyHomeNativeUrl = 'HomeNativeUrl';
const String keyHomeNativeAlternate = 'HomeNativeAlternate';

const String keyMainBannerAdmobId = 'MainBannerAdmobId';
const String keyMainBannerFBId = 'MainBannerFBId';
const String keyMainBannerTypes = 'MainBannerTypes';
const String keyMainBannerActive = 'MainBannerActive';
const String keyMainBannerImage = 'MainBannerImage';
const String keyMainBannerUrl = 'MainBannerUrl';
const String keyMainBannerAlternate = 'MainBannerAlternate';

const String keyBackNativeAdmobId = 'BackNativeAdmobId';
const String keyBackNativeFBId = 'BackNativeFBId';
const String keyBackNativeTypes = 'BackNativeTypes';
const String keyBackNativeActive = 'BackNativeActive';
const String keyBackNativeImage = 'BackNativeImage';
const String keyBackNativeUrl = 'BackNativeUrl';
const String keyBackNativeAlternate = 'BackNativeAlternate';

const String keyCalendarBannerAdmobId = 'CalendarBannerAdmobId';
const String keyCalendarBannerFBId = 'CalendarBannerFBId';
const String keyCalendarBannerTypes = 'CalendarBannerTypes';
const String keyCalendarBannerActive = 'CalendarBannerActive';
const String keyCalendarBannerImage = 'CalendarBannerImage';
const String keyCalendarBannerUrl = 'CalendarBannerUrl';
const String keyCalendarBannerAlternate = 'CalendarBannerAlternate';

const String keyHomeBannerAdmobId = 'HomeBannerAdmobId';
const String keyHomeBannerFBId = 'HomeBannerFBId';
const String keyHomeBannerTypes = 'HomeBannerTypes';
const String keyHomeBannerActive = 'HomeBannerActive';
const String keyHomeBannerImage = 'HomeBannerImage';
const String keyHomeBannerUrl = 'HomeBannerUrl';
const String keyHomeBannerAlternate = 'HomeBannerAlternate';

const String keyDialogTitle = 'DialogTitle';
const String keyDialogDescription = 'DialogDescription';
const String keyDialogBtn1 = 'DialogBtn1';
const String keyDialogBtn2 = 'DialogBtn2';
const String keyDialogUrl = 'DialogUrl';
const String keyDialogStatus = 'DialogStatus';
const String keyDialogForceFully = 'DialogForceFully';
const String keyDialogVersionList = 'DialogVersionList';
const String keyDialogCurrentVersion = 'DialogCurrentVersion';


class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String getString({required String key}) {
    return _prefsInstance!.getString(key) ?? "";
  }

  static Future<bool> setString(
      {required String key, required String value}) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static int getInt({required String key}) {
    return _prefsInstance!.getInt(key) ?? 0;
  }

  static Future<bool> setInt(
      {required String key, required int value}) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static bool getBool({required String key}) {
    return _prefsInstance!.getBool(key) ?? false;
  }

  static Future<bool> setBool(
      {required String key, required bool value}) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static String getLanguage() {
    return _prefsInstance!.getString(keyCurrentLanguage) ?? "E";
  }

  static Future<bool> setLanguage({required String value}) async {
    var prefs = await _instance;
    return prefs.setString(keyCurrentLanguage, value);
  }

  static String getTimeFormat() {
    return _prefsInstance!.getString(keyHourFormat) ?? "hh:mm a";
  }

  static Future<bool> setTimeFormat({required String value}) async {
    var prefs = await _instance;
    return prefs.setString(keyHourFormat, value);
  }

  static void clearSharedPreferences() async {
    var prefs = await _instance;
    await prefs.clear();
  }

  static void removeKey(key) async {
    var prefs = await _instance;
    await prefs.remove(key);
  }
}

