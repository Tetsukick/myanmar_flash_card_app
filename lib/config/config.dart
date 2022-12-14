import 'package:flutter/foundation.dart';

class Config {
  static const dictionarySpreadSheetName = '001_myanmar_dictionary';
  static const directoryName = 'PROD';
  static const dbName = 'app_database.db';
  static const adUnitIdAndroidBanner = kDebugMode ? 'ca-app-pub-3940256099942544/6300978111' : 'ca-app-pub-9974265212679212/3788562658';
  static const adUnitIdIosBanner = kDebugMode ? 'ca-app-pub-3940256099942544/2934735716' : 'ca-app-pub-9974265212679212~8869498946';
  static const adUnitIdAndroidInterstitial = kDebugMode ? 'ca-app-pub-3940256099942544/8691691433' : 'ca-app-pub-9974265212679212/9292132786';
  static const adUnitIdIosInterstitial = kDebugMode ? 'ca-app-pub-3940256099942544/5135589807' : 'ca-app-pub-9974265212679212~8869498946';

  static const apiKeyHeader = "x-api-key";
  static const contentTypeHeader = "Content-type";
  static const acceptHeader = "Accept";
  static const authorizationHeader = "Authorization";
}