import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/generated/l10n.dart';

class VerifyEmailProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;
  bool isEmailVerified = false;
  Timer? timer;

  init(String fromScreen) {
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      await FirebaseAuth.instance.currentUser?.reload();

      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      notifyListeners();

      if (isEmailVerified) {
        Utils.showSuccess(S.of(_context).yourEmailHasBeenVerifiedSuccessful);
        timer?.cancel();
        if (fromScreen == RoutesStrings.forgetPassword) {
          _context.pushReplacementNamed(RoutesStrings.newPassword);
        } else if (fromScreen == RoutesStrings.signUp) {
          _context.pushReplacementNamed(RoutesStrings.signIn);
        } else if (fromScreen == RoutesStrings.signIn) {
          _context.pushReplacementNamed(RoutesStrings.home);
        }
      }
    });
  }

  resendVerify(String fromScreen) async {
    timer?.cancel();
    init(fromScreen);
  }

  disposeSc() {
    timer?.cancel();
  }

  back(String fromScreen) {
    timer?.cancel();
    _context.pushReplacementNamed(fromScreen);
  }
}
