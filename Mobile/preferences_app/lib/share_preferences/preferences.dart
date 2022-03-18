import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static bool _isLogin = false;
  static String _urlProfileImage = "";
  static String _userEmail = "";
  static String _displayName = "";
  static String _userId = "";
  static String _name = "";
  static bool _isDarkMode = false;
  static int _gender = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  ///User displayName
  static String get displayName {
    return _prefs.getString('displayName') ?? _displayName;
  }

  static set displayName(String value) {
    _displayName = value;
    _prefs.setString('displayName', value);
  }

  ///User Profile Img
  static String get urlProfileImage {
    return _prefs.getString('urlProfileImage') ?? _urlProfileImage;
  }

  static set urlProfileImage(String value) {
    _urlProfileImage = value;
    _prefs.setString('urlProfileImage', value);
  }

  ///UserEmail
  static String get userEmail {
    return _prefs.getString('userEmail') ?? _userEmail;
  }

  static set userEmail(String value) {
    _userEmail = value;
    _prefs.setString('userEmail', value);
  }

  ///userId
  static String get userId {
    return _prefs.getString('userId') ?? _userId;
  }

  static set userId(String value) {
    _userId = value;
    _prefs.setString('userId', value);
  }

  ///userIsLogged
  static bool get isLogin {
    return _prefs.getBool('isLogin') ?? _isLogin;
  }

  static set isLogin(bool value) {
    _isLogin = value;
    _prefs.setBool('userId', value);
  }

  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static bool get isDarkMode {
    return _prefs.getBool("isDarkMode") ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static int get gender {
    return _prefs.getInt("gender") ?? _gender;
  }

  static set gender(int value) {
    _gender = value;
    _prefs.setInt('gender', value);
  }
}
