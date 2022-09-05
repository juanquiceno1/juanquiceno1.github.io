import '../../../../global_locator.dart';
import '../network/api_repository.dart';
import 'account_executive_endpoint.dart';

abstract class AccountExecutiveRepository {
  Future<Map<String, dynamic>> data();
}

class AccountExecutiveDefault extends AccountExecutiveRepository {
  final _api = global<APIRepository>();

  @override
  Future<Map<String, dynamic>> data() async {
    var endpoint = AccountExecutiveEndpoint();
    return await _api.request(
      endpoint: endpoint,
    );
  }
}
