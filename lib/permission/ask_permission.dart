import 'package:permission_handler/permission_handler.dart';

Future<void> checkPermissionStatus() async {
  var status = await Permission.location.status;
  var activityRecognitionStatus = await Permission.activityRecognition.status;

  // ---------------------------------------

  if (activityRecognitionStatus.isGranted) {
    await Permission.activityRecognition.request();
  } else if (activityRecognitionStatus.isGranted) {
    openAppSettings();
  }
  if (status.isDenied) {
    await Permission.location.request();
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}

// -------------------------
Future<void> requestLocationPermission() async {
  var status = await Permission.location.status;
  if (status.isDenied) {
    await Permission.location.request();
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}

// -------------------------
Future<void> requestActivityRecognitionPermission() async {
  var status = await Permission.activityRecognition.status;
  if (status.isDenied) {
    await Permission.activityRecognition.request();
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}
