import 'package:url_launcher/url_launcher.dart';

class ExternalOpen {
  Future<void> url({required url}) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> phoneCall({required phoneNumber}) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (!await launchUrl(launchUri)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> email({required subject, Map<String, dynamic>? query}) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: subject,
      queryParameters: query,
    );
    print(emailLaunchUri);
    if (!await launchUrl(emailLaunchUri)) {
      throw 'Could not launch $url';
    }
  }
}
