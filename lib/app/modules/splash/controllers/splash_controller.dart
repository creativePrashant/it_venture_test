import 'dart:async';

import 'package:get/get.dart';
import 'package:it_venture_test/app/modules/home/views/home_view.dart';
import 'package:it_venture_test/utils/memory_management.dart';

import '../../../../utils/page_transition.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  var duration = Duration(seconds: 3).obs;

  @override
  void onInit() {
    MemoryManagement.init();
    startTime();
    super.onInit();
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
      transition: AppPageTransition.leftToRightTransition,
      duration: Duration(
        seconds: 2,
      ),
    );
  }
}
