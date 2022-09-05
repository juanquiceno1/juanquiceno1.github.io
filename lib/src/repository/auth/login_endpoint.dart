import '../network/endpoint.dart';

class LoginEndpoint extends Endpoint {
  final String nit;
  final String password;
  LoginEndpoint({required this.nit, required this.password});

  @override
  Method get method => Method.post;

  @override
  Map<String, dynamic> get parameters => {
        'usuario': nit,
        'contrasena': password,
      };

  @override
  String get path => 'api/sortime/AutenticarUsuario';
}
