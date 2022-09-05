import 'package:permission_handler/permission_handler.dart';

class PermissionCustom {
  Future<bool> getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
      return false;
    } else if (await Permission.storage.request().isDenied) {
      return false;
    } else {
      return false;
    }
  }
}
