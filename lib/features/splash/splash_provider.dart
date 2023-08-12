import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/services/network_services.dart';

class SplashProvider extends ChangeNotifier {
  final NetworkInfo _networkInfo;
  SplashProvider(this._networkInfo);
  final _context = NavigationService.context;

  init() {
    _networkInfo.initializeNetworkStream();
    User? user = FirebaseAuth.instance.currentUser;
    Future.delayed(Duration(seconds: 2), () {
      if (user != null) {
        if (!user.emailVerified) {
          _context.pushReplacementNamed(RoutesStrings.verifyEmail);
        } else {
          _context.pushReplacementNamed(RoutesStrings.home);
        }
      } else
        _context.pushReplacementNamed(RoutesStrings.signIn);
    });
  }
}
