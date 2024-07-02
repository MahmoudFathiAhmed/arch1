
import 'package:arch1/core/language/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = 'prefsKeyLang';
const String userToken = 'userToken';
// const String prefsKeyToken = 'prefsKeyToken';

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AppPreferences(this._sharedPreferences);

  /// Removes a value from SharedPreferences with given [key].
  Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    await _sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    await _sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  Future<dynamic> setData(String key, dynamic value) async {
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case String:
        await _sharedPreferences.setString(key, value);
        break;
      case int:
        await _sharedPreferences.setInt(key, value);
        break;
      case bool:
        await _sharedPreferences.setBool(key, value);
        break;
      case double:
        await _sharedPreferences.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  Future<bool> getBool(String key) async {
    return _sharedPreferences.getBool(key) ?? false;
  }

  Future<double> getDouble(String key) async {
    return _sharedPreferences.getDouble(key) ?? 0.0;
  }

  Future<int> getInt(String key) async {
    return _sharedPreferences.getInt(key) ?? 0;
  }

  Future<String> getString(String key) async {
    return _sharedPreferences.getString(key) ?? '';
  }

  
  // Secure Storage related functions
  Future<void> setSecuredString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String> getSecuredString(String key) async {
    return await _secureStorage.read(key: key) ?? '';
  }

  Future<void> clearAllSecuredData() async {
    await _secureStorage.deleteAll();
  }

  Future<void> removeSecuredData(String key) async {
    await _secureStorage.delete(key: key);
  }

  /// Get App Language And Set Default Language.
  Future<String> getAppLanguage() async {
    String language = _sharedPreferences.getString(prefsKeyLang) ??
        LanguageType.english.getValue();// default language is english
    return language;
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.arabic.getValue()) {
      /// set it to english
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.english.getValue());
    } else {
      /// set it to english
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.arabic.getValue());
    }
  }

  Future<Locale> getLocale() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocale;
    } else {
      return englishLocale;
    }
  }

// Future<void> saveToken(String token) async{
//   _sharedPreferences.setString(prefsKeyToken, token);
// }
// Future<String?> getToken() async{
//   String? token= _sharedPreferences.getString(prefsKeyToken);
//   return token;
// }
}