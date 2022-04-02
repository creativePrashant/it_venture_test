import 'package:flutter/material.dart';

class GlobalKeyConsts {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  // static final GlobalKey<ScaffoldState> scaffoldStateGlobal = GlobalKey<ScaffoldState>();
  static BuildContext? buildContextPayload;
}
