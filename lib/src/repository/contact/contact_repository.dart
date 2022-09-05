import '../../../../global_locator.dart';
import '../network/api_repository.dart';
import 'contact_endpoint.dart';

abstract class ContactRepository {
  Future<Map<String, dynamic>> data();
}

class ContactDefault extends ContactRepository {
  final _api = global<APIRepository>();

  @override
  Future<Map<String, dynamic>> data() async {
    var endpoint = ContactEndpoint();
    return await _api.request(
      endpoint: endpoint,
    );
  }
}
