import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';

class NewPasswordProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;
  GlobalKey<FormState> _globalKey = GlobalKey(debugLabel: "nwe password");
  GlobalKey<FormState> get globalKey => _globalKey;

  TextEditingController newPasswordTEXT = TextEditingController();
  TextEditingController confirmNewPasswordTEXT = TextEditingController();
  bool isLoading = false;

  save() {
    if (_globalKey.currentState!.validate()) {
      _context.pushReplacementNamed(RoutesStrings.signIn);
    }
  }

  back() {
    _context.pushReplacementNamed(RoutesStrings.signIn);
  }
}
