import '../../../../global_locator.dart';
import '../network/api_repository.dart';
import 'information_endpoint.dart';

abstract class InformationRepository {
  Future<Map<String, dynamic>> informes(
      {required int typeInform,
      required DateTime since,
      required DateTime until});
}

class InformationDefault extends InformationRepository {
  final _api = global<APIRepository>();

  @override
  Future<Map<String, dynamic>> informes(
      {required int typeInform,
      required DateTime since,
      required DateTime until}) async {
    var endpoint =
        InformationEndpoint(typeInform: typeInform, since: since, until: until);
    return await _api.request(
      endpoint: endpoint,
    );
  }
}
