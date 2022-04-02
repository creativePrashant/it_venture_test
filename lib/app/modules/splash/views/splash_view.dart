import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:it_venture_test/utils/app_colors.dart';
import 'package:it_venture_test/utils/asset_strings.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Container(
        height: mediaQuery.height,
        width: mediaQuery.width,
        child: Center(
          child: CachedNetworkImage(
            imageUrl: AssetStrings.splashScreenImage,
            color: AppColors.appBlackColor,
          ),
        ),
      )),
    );
  }
}
