import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;
  bool isLoading = false;
  GlobalKey<FormState> _globalKey = GlobalKey(debugLabel: 'forget password');
  GlobalKey<FormState> get globalKey => _globalKey;

  TextEditingController emailTEXT = TextEditingController();

  nextButton() {
    if (_globalKey.currentState!.validate()) {
      _context.pushReplacementNamed(
        RoutesStrings.verifyEmail,
        queryParams: {"from": RoutesStrings.forgetPassword},
      );
    }
  }

  back() {
    _context.pushReplacementNamed(RoutesStrings.signIn);
  }
}
