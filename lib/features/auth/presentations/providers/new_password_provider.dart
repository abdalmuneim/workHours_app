import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/generated/l10n.dart';

class NewPasswordProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;
  GlobalKey<FormState> _globalKey = GlobalKey(debugLabel: "nwe password");
  GlobalKey<FormState> get globalKey => _globalKey;

  TextEditingController newPasswordTEXT = TextEditingController();
  TextEditingController confirmNewPasswordTEXT = TextEditingController();
  TextEditingController currentPasswordTEXT = TextEditingController();
  bool isLoading = false;

  save() async {
    if (_globalKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();

      //Create an instance of the current user.
      var user = await FirebaseAuth.instance.currentUser!;
      //Must re-authenticate user before updating the password. Otherwise it may fail or user get signed out.

      final cred = await EmailAuthProvider.credential(
          email: user.email!, password: currentPasswordTEXT.text);
      await user.reauthenticateWithCredential(cred).then((value) async {
        await user
            .updatePassword(newPasswordTEXT.text)
            .then((_) {})
            .catchError((error) {
          print(error);
        });
      }).catchError((err) {
        print(err);
      });
      isLoading = false;
      notifyListeners();
      clearFiles();
      Utils.showSuccess(S.of(_context).changedPasswordSuccess);
    }
  }

  clearFiles() {
    newPasswordTEXT.clear();
    confirmNewPasswordTEXT.clear();
  }

  back() {
    _context.pushReplacementNamed(RoutesStrings.signIn);
  }
}
