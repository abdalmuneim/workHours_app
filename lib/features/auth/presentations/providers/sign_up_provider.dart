import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';

class SignUpProvider extends ChangeNotifier {
  final _context = NavigationService.context;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;

  final firstNameTEXT = TextEditingController();
  final lastNAmeTEXT = TextEditingController();
  final emailTEXT = TextEditingController();
  final passwordTEXT = TextEditingController();
  final confirmPasswordTEXT = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  signUp() async {
    if (_globalKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();
      Future.delayed(Duration(seconds: 2), () {
        _context.pushNamed(RoutesStrings.verifyEmail);
        _isLoading = false;
        notifyListeners();
      });
    }
  }

  haveAccount() {
    _context.pop();
  }
}
