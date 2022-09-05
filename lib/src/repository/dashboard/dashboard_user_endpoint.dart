import 'dart:io';

import '../../utils/preferences/preferences_user.dart';
import '../network/endpoint.dart';

class DashboardEndpoint extends Endpoint {
  @override
  Method get method => Method.post;

  @override
  Map<String, String> get headers => {
        HttpHeaders.authorizationHeader: 'Bearer ${PreferencesUser().token}',
      };

  @override
  Map<String, dynamic> get parameters => {
        'cedulaColaborador': PreferencesUser().document,
      };

  @override
  String get path => 'api/sortime/DatosTrabajador';
}
