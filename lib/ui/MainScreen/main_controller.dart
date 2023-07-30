import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../utils/new_version_plus.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {

  static const platform = MethodChannel('MethodChannelID');

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController animationController;

  String osVersion = "", deviceName = "", deviceID = "";

  String packageName = "", version = "";

  RxString batteryLevel="".obs;


  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animationController.repeat(reverse: true);

    Future.delayed(Duration.zero, () {
      _checkVersion();

      getDataMethod();
    });
  }

  void _checkVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      packageName = packageInfo.packageName;
      version = packageInfo.buildNumber;

      final newVersion = NewVersionPlus(
        androidId: packageName,
      );
      final status = await newVersion.getVersionStatus();
      if (double.parse(status!.storeVersion) >
          double.parse(status.localVersion)) {
        newVersion.showUpdateDialog(
          context: Get.context!,
          versionStatus: status,
          dialogTitle: "New Update Available!",
          dismissButtonText: "Later",
          dialogText:
              "Update ${status.storeVersion} is available to download. By downloading the latest update you will get the latest features, improvements and bug fixes.",
          dismissAction: () {
            Get.back();
          },
          updateButtonText: "Update Now",
        );
      }

      print("DEVICE : " + status.localVersion);
      print("STORE : " + status.storeVersion);
    } catch (e) {}
  }


  getDataMethod()async{
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel.value = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel.value = "Failed to get battery level: '${e.message}'.";
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
