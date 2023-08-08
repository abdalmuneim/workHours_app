import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';

class ProfileProvider extends ChangeNotifier {
  final _context = NavigationService.context;

  final GlobalKey<FormState> _globalKey =
      GlobalKey<FormState>(debugLabel: "profile");
  GlobalKey<FormState> get globalKey => _globalKey;

  final firstNameTEXT = TextEditingController();
  final lastNAmeTEXT = TextEditingController();
  final emailTEXT = TextEditingController();
  final passwordTEXT = TextEditingController();
  final confirmPasswordTEXT = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  navToChangePassword() {
    _context.pushNamed(RoutesStrings.changePassword);
  }

  save() {
    if (globalKey.currentState!.validate()) {
      _context.pop();
    }
  }

  back() {
    _context.pushReplacementNamed(RoutesStrings.home);
  }

  logOut() {
    _context.pushReplacementNamed(RoutesStrings.signIn);
  }
}
