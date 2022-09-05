import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../../global_locator.dart';
import '../network/shared_configuration.dart';
import 'add_image_endpoint.dart';

abstract class AddImageRepository {
  Future<dynamic> addImage(List<dynamic> data);
}

class AddImageDefault extends AddImageRepository {
  final _logger = global<Logger>();

  @override
  Future<dynamic> addImage(List<dynamic> data) async {
    var endpoint = AddImageEndpoint();
    _logger.d('endpoint $endpoint');
    final url = Uri.https(
      SharedConfiguration.network.baseUrlDevelopment,
      endpoint.path,
    );
    var request = http.MultipartRequest('POST', url);
    for (AddImageModel item in data) {
      request.files.add(
        await http.MultipartFile.fromPath(
          item.key,
          item.path,
        ),
      );
    }
    request.headers.addAll(endpoint.headers);
    try {
      http.StreamedResponse response = await request.send();
      _logger.d('status code: ${response.statusCode}');
      String data = await response.stream.bytesToString();
      final decodedBody = json.decode(data);
      _logger.d('status body: $decodedBody');
      return response.statusCode == 200 ? decodedBody : null;
    } catch (e) {
      _logger.d('Error Load file: $e');
      return null;
    }
  }
}

class AddImageModel {
  AddImageModel({required this.key, required this.path});

  String key;
  String path;

  factory AddImageModel.fromJson(Map<String, dynamic> json) => AddImageModel(
        key: '',
        path: '',
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'path': path,
      };
}
