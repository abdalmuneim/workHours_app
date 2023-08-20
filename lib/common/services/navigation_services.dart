import 'package:flutter/material.dart';
import 'package:workhours/common/routes/routes.dart';

class NavigationService {
  static BuildContext get context =>
      Routes.router.routerDelegate.navigatorKey.currentContext!;
  static String get routName => Routes.router.location;
}
