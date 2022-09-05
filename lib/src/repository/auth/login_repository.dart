import '../../../../global_locator.dart';
import '../network/api_repository.dart';
import 'login_endpoint.dart';

abstract class LoginRepository {
  Future<Map<String, dynamic>> login(
      {required String nit, required String password});
}

class LoginDefault extends LoginRepository {
  final _api = global<APIRepository>();

  @override
  Future<Map<String, dynamic>> login({
    required String nit,
    required String password,
  }) async {
    var endpoint = LoginEndpoint(
      nit: nit,
      password: password,
    );
    return await _api.request(
      endpoint: endpoint,
    );
  }
}
