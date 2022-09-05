import 'dart:io';

import '../../utils/preferences/preferences_user.dart';
import '../network/endpoint.dart';

class ContactEndpoint extends Endpoint {
  ContactEndpoint();
  @override
  Method get method => Method.get;

  @override
  Map<String, String> get headers => {
        HttpHeaders.authorizationHeader: 'Bearer ${PreferencesUser().token}',
      };

  @override
  String get path => 'api/sortime/Contacto';
}
