import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/services/network_services.dart';

class SplashProvider extends ChangeNotifier {
  final NetworkInfo _networkInfo;

  SplashProvider(this._networkInfo);
  final context = NavigationService.context;

  Future<void> startTimer() async {
    _networkInfo.initializeNetworkStream();
    Timer(const Duration(seconds: 2), () async => await _navigate());
  }

  _navigate() async {
    context.pushReplacementNamed(RoutesStrings.signIn);
  }
}
