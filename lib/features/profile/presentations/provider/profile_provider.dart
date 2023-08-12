import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  logOut() async {
    await FirebaseAuth.instance.signOut();
    FlutterSecureStorage secureStorage = await FlutterSecureStorage();
    secureStorage.delete(key: "uid");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("User");
    _context.pushReplacementNamed(RoutesStrings.signIn);
  }
}
