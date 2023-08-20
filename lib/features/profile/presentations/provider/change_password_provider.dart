import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/services/navigation_services.dart';

class ChangePasswordProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;
  GlobalKey<FormState> _globalKey = GlobalKey(debugLabel: 'change password');
  GlobalKey<FormState> get globalKey => _globalKey;
  TextEditingController oldPasswordTEXT = TextEditingController();
  TextEditingController newPasswordTEXT = TextEditingController();
  TextEditingController confirmNewPasswordTEXT = TextEditingController();
  bool isLoading = false;

  changePassword() async {
    if (_globalKey.currentState!.validate()) {
      isLoading = true;

      //Create an instance of the current user.
      var user = await FirebaseAuth.instance.currentUser!;
      //Must re-authenticate user before updating the password. Otherwise it may fail or user get signed out.
      try {
        final cred = await EmailAuthProvider.credential(
            email: user.email!, password: oldPasswordTEXT.text.trim());
        await user.reauthenticateWithCredential(cred).then((value) async {
          await user.updatePassword(newPasswordTEXT.text.trim()).then((_) {});
        });
        isLoading = false;
        notifyListeners();
      } catch (e) {
        print(e);
      }
      clearFiles();
      _context.pop();
    }
  }

  clearFiles() {
    oldPasswordTEXT.clear();
    newPasswordTEXT.clear();
    confirmNewPasswordTEXT.clear();
  }

  back() {
    _context.pop();
  }
}
