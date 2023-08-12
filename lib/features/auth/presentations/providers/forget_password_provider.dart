import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/generated/l10n.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;
  bool isLoading = false;
  GlobalKey<FormState> _globalKey = GlobalKey(debugLabel: 'forget password');
  GlobalKey<FormState> get globalKey => _globalKey;

  TextEditingController emailTEXT = TextEditingController();

  nextButton() async {
    if (_globalKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailTEXT.text.trim())
          .then((value) {
        isLoading = true;
        notifyListeners();
        Utils.showSuccess(S.of(_context).passwordRestEmailSent);
        _context.pushReplacementNamed(
          RoutesStrings.verifyEmail,
          queryParams: {"from": RoutesStrings.forgetPassword},
        );
      }).catchError((error) {
        print("error: ${error}");
      });
    }
  }

  back() {
    _context.pushReplacementNamed(RoutesStrings.signIn);
  }
}
