import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';

class VerifyEmailProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;

  init(String fromScreen) {
    log("----------> ${fromScreen}");
    if (fromScreen == RoutesStrings.forgetPassword) {
      Future.delayed(
        Duration(seconds: 3),
        () => _context.pushReplacementNamed(RoutesStrings.newPassword),
      );
    } else
      Future.delayed(
        Duration(seconds: 3),
        () => _context.pushReplacementNamed(RoutesStrings.home),
      );
  }
}
