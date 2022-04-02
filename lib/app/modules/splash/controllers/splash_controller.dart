import 'dart:async';

import 'package:get/get.dart';
import 'package:it_venture_test/app/modules/home/views/home_view.dart';
import 'package:it_venture_test/utils/memory_management.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../utils/page_transition.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  var duration = Duration(seconds: 3).obs;
  String? appName;
  String? packageName;
  var version = "".obs;
  String? buildNumber;

  @override
  void onInit() {
    MemoryManagement.init();
    getInfo();
    startTime();
    super.onInit();
  }

  void getInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version.value = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  startTime() async {
    return Timer(duration.value, navigateToOtherScreen);
  }

  navigateToOtherScreen() {
    Get.off(
      () => HomeView(),
      transition: AppPageTransition.zoomPageTransition,
      duration: Duration(
        seconds: 1,
      ),
    );
  }
}
