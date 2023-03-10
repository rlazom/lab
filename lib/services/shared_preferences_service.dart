import 'package:lab/common/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKey {
  token,
  tokenType,
}

class SharedPreferencesService {
  /// Singleton boilerplate
  static final SharedPreferencesService _sharedPreferencesService = SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _sharedPreferencesService;
  }

  SharedPreferencesService._internal();

  Future initialize() async => _prefs = await SharedPreferences.getInstance();

  /// Singleton boilerplate

  late SharedPreferences _prefs;
  SharedPreferences get prefs => _prefs;


  String getToken() {
    var token = prefs.getString(SharedPreferencesKey.token.name.toShortString);
    if(token == null) {
      throw Exception('ESTA TALLA NOTHING DOING');
    }
    return token!;   /// EL "!" NO ES NECESARIO POR EL IF DE ARRIBA, PERO ES LA FORMA COMO SE ASEGURA KE ESA VARIABLE TIENE VALOR
  }

  setToken(String token) {
    prefs.setString(SharedPreferencesKey.token.name.toShortString, token);
  }

  void removeToken() {
    prefs.remove(SharedPreferencesKey.token.name.toShortString);
  }
}