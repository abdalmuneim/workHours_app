import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/auth/data/models/user_model.dart';
import 'package:workhours/generated/l10n.dart';

class VerifyEmailProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;
  bool isEmailVerified = false;
  Timer? timer;
  final _user = FirebaseAuth.instance.currentUser;

  init(String fromScreen) {
    _user?.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      await _user?.reload();

      isEmailVerified = _user!.emailVerified;
      notifyListeners();

      if (isEmailVerified) {
        timer?.cancel();
        await FirebaseFirestore.instance
            .collection("USer")
            .doc(_user?.uid)
            .update(UserModel(isVerified: isEmailVerified).toJson());
        Utils.showSuccess(S.of(_context).yourEmailHasBeenVerifiedSuccessful);
        if (fromScreen == RoutesStrings.forgetPassword) {
          _context.pushReplacementNamed(RoutesStrings.signIn);
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
