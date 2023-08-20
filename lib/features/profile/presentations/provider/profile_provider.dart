import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/key_storage.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/auth/data/models/user_model.dart';
import 'package:workhours/generated/l10n.dart';

class ProfileProvider extends ChangeNotifier {
  final _context = NavigationService.context;
  late SharedPreferences preferences;

  final GlobalKey<FormState> _globalKey =
      GlobalKey<FormState>(debugLabel: "profile");
  GlobalKey<FormState> get globalKey => _globalKey;

  TextEditingController firstNameTEXT = TextEditingController();
  TextEditingController lastNAmeTEXT = TextEditingController();
  TextEditingController emailTEXT = TextEditingController();
  TextEditingController passwordTEXT = TextEditingController();
  TextEditingController confirmPasswordTEXT = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  navToChangePassword() {
    _context.pushNamed(RoutesStrings.changePassword);
  }

  save() async {
    if (globalKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();
      final user = UserModel(
          firstName: firstNameTEXT.text,
          lastName: lastNAmeTEXT.text,
          email: emailTEXT.text);
      try {
        await usersFR
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .update(user.toJson());
        await preferences.setStringList(
          KeyStorage.user,
          [firstNameTEXT.text, lastNAmeTEXT.text, emailTEXT.text],
        );
        Utils.showSuccess(S.of(_context).updataSuccess);
        _isLoading = false;
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }

  back() {
    _context.pushReplacementNamed(RoutesStrings.home);
  }

  init() async {
    preferences = await SharedPreferences.getInstance();
    firstNameTEXT.text = preferences.getStringList(KeyStorage.user)?[0] ?? "";
    lastNAmeTEXT.text = preferences.getStringList(KeyStorage.user)?[1] ?? "";
    emailTEXT.text = preferences.getStringList(KeyStorage.user)?[2] ?? "";
  }
}
