import '../../network/endpoint.dart';

class RecoverEndpoint extends Endpoint {
  final String document;
  RecoverEndpoint({required this.document});

  @override
  Method get method => Method.post;

  @override
  Map<String, dynamic> get parameters => {
        'usuario': document,
      };

  @override
  String get path => 'api/sortime/RecuperarCredenciales';
}
