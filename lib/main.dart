import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:it_venture_test/utils/global_key_constants.dart';
import 'package:it_venture_test/utils/res_string.dart';
import 'package:it_venture_test/utils/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => GetMaterialApp(
        builder: EasyLoading.init(),
        theme: theme(),
        debugShowCheckedModeBanner: false,
        navigatorKey: GlobalKeyConsts.navigatorKey,
        initialRoute: AppPages.INITIAL,
        title: "${ResString().get('app_name')}",
        getPages: AppPages.routes,
      ),
    );
  }
}
