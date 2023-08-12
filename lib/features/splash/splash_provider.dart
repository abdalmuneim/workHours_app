import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/services/network_services.dart';

class SplashProvider extends ChangeNotifier {
  final NetworkInfo _networkInfo;
  final _firebase = FirebaseAuth.instance.currentUser;
  SplashProvider(this._networkInfo);
  final _context = NavigationService.context;

  init() async {
    _networkInfo.initializeNetworkStream();
    Future.delayed(
      Duration(seconds: 2),
      () {
        _context.pushReplacementNamed(RoutesStrings.signIn);
      },
    );
  }
}
