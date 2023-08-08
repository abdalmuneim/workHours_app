import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';

class SignInProvider extends ChangeNotifier {
  final GlobalKey<FormState> _globalKey =
      GlobalKey<FormState>(debugLabel: "sig in");
  GlobalKey<FormState> get globalKey => _globalKey;
  final _context = NavigationService.context;

  final emailTEXT = TextEditingController();
  final passwordTEXT = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  signIn() {
    if (_globalKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();
      Future.delayed(Duration(seconds: 2), () {
        _context.pushReplacementNamed(RoutesStrings.home);
        _isLoading = false;
        notifyListeners();
      });
    }
  }

  notHaveAccount() {
    _context.pushNamed(
      RoutesStrings.signUp,
    );
  }

  forgetPassword() {
    _context.pushReplacementNamed(
      RoutesStrings.forgetPassword,
    );
  }
}
