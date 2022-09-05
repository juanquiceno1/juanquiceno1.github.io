import 'dart:io';

import '../../utils/preferences/preferences_user.dart';
import '../network/endpoint.dart';

class AddImageEndpoint extends Endpoint {
  @override
  Method get method => Method.post;

  @override
  Map<String, String> get headers => {
        // 'Authorization': PreferencesUser().token,
        // 'Content-Type': 'multipart/form-data',
        HttpHeaders.authorizationHeader: PreferencesUser().token,
        HttpHeaders.contentTypeHeader: 'multipart/form-data',
      };

  @override
  Map<String, dynamic> get parameters => {};

  @override
  String get path => 'piuts/api/services_user/addImage';
}
