import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  void clearAll() {
    _sharedPrefs.clear();
  }

  bool get lightTheme => _sharedPrefs.getBool('lightTheme') ?? true;

  set lightTheme(bool value) {
    _sharedPrefs.setBool('lightTheme', value);
  }

  


  
}
