import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {
  static final PreferencesUser _instancia = PreferencesUser._internal();
  factory PreferencesUser() {
    return _instancia;
  }
  late SharedPreferences _prefs;
  PreferencesUser._internal();

  initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get route {
    return _prefs.getString('route') ?? '';
  }

  set setRoute(String value) {
    _prefs.setString('route', value);
  }

  get token {
    return _prefs.getString('token') ?? '';
  }

  set setToken(String value) {
    _prefs.setString('token', value);
  }

  get document {
    return _prefs.getString('document') ?? '';
  }

  set setDocument(String value) {
    _prefs.setString('document', value);
  }

  get idClient {
    return _prefs.getString('idClient') ?? '';
  }

  set setIdClient(String value) {
    _prefs.setString('idClient', value);
  }
}
