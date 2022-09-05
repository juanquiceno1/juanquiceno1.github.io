import '../../../../global_locator.dart';
import '../network/api_repository.dart';
import 'dashboard_user_endpoint.dart';

abstract class DashboardRepository {
  Future<Map<String, dynamic>> user();
}

class DashboardDefault extends DashboardRepository {
  final _api = global<APIRepository>();

  @override
  Future<Map<String, dynamic>> user() async {
    var endpoint = DashboardEndpoint();
    return await _api.request(
      endpoint: endpoint,
    );
  }
}
