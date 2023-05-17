import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPrefs? _instance;
  late SharedPreferences _sharedPrefs;
  factory SharedPrefs()=>_instance ??= SharedPrefs._();

  SharedPrefs._();

  Future init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }
  SharedPreferences get instance => _sharedPrefs;

  Future<void> saveString({required String key, required String value }) async {
    await _sharedPrefs.setString(key, value);
  }
    String getString({required String key }) {
    return  _sharedPrefs.getString(key) ??'';
  }

}