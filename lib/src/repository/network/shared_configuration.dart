import 'dart:io';

abstract class SharedConfiguration {
  static const network = Network._();
}

class Network {
  const Network._();

  final Map<String, String> headers = const {
    HttpHeaders.acceptHeader: '*/*',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  final bool isDebug = true;
  final String baseUrlProduction = 'apigateway-eta.vercel.app';
  final String baseUrlDevelopment = 'apigateway-eta.vercel.app';
}
