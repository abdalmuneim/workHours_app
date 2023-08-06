import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  AppPermissions() {
    askLocalStoragePermission();
  }
  static askLocalStoragePermission() async {
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.accessMediaLocation,
      Permission.manageExternalStorage,
    ].request();

    /// permission storage
    if (statuses[Permission.storage]!.isDenied) {
      await Permission.storage.request().then((value) {
        if (!value.isGranted) {
          askLocalStoragePermission();
        }
      });
    }

    /// permission accessMediaLocation
    if (statuses[Permission.accessMediaLocation]!.isDenied) {
      await Permission.accessMediaLocation.request().then((value) {
        if (!value.isGranted) {
          askLocalStoragePermission();
        }
      });
    }

    /// permission manageExternalStorage
    if (statuses[Permission.manageExternalStorage]!.isDenied) {
      await Permission.manageExternalStorage.request().then((value) {
        if (!value.isGranted) {
          askLocalStoragePermission();
        }
      });
    }
  }
}
