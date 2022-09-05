import '../../../../global_locator.dart';
import '../../network/api_repository.dart';
import 'recover_endpoint.dart';

abstract class RecoverRepository {
  Future<Map<String, dynamic>> recover({required String document});
}

class RecoverDefault extends RecoverRepository {
  final _api = global<APIRepository>();

  @override
  Future<Map<String, dynamic>> recover({
    required String document,
  }) async {
    var endpoint = RecoverEndpoint(
      document: document,
    );
    return await _api.request(
      endpoint: endpoint,
    );
  }
}
