import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workhours/common/utils/key_storage.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/auth/data/models/user_model.dart';
import 'package:workhours/generated/l10n.dart';

class SignUpProvider extends ChangeNotifier {
  final _context = NavigationService.context;

  final GlobalKey<FormState> _globalKey =
      GlobalKey<FormState>(debugLabel: "sign up");
  GlobalKey<FormState> get globalKey => _globalKey;

  final firstNameTEXT = TextEditingController();
  final lastNAmeTEXT = TextEditingController();
  final emailTEXT = TextEditingController();
  final passwordTEXT = TextEditingController();
  final confirmPasswordTEXT = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  haveAccount() {
    _context.pop();
  }

  bool accountExists = false;

  Future<void> signUp() async {
    String uid = "";
    if (_globalKey.currentState!.validate()) {
      accountExists = false;
      _isLoading = true;
      notifyListeners();
      try {
        //Create a new email and password in firebase
        final fi = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTEXT.text.trim(),
          password: passwordTEXT.text.trim(),
        );
        uid = await fi.user?.uid ?? "";
      } on FirebaseAuthException catch (e) {
        _isLoading = false;
        notifyListeners();
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          Utils.showError(S.of(_context).thePasswordProvidedIsTooWeak);
        } else if (e.code == 'email-already-in-use') {
          accountExists = true;
          notifyListeners();
          Utils.showError(S.of(_context).theAccountAlreadyExistsForThatEmail);
          print('The account already exists for that email.');
        } else {
          Utils.showError(e.message ?? "");
          print(e.message);
        }
      } catch (e) {
        _isLoading = false;
        notifyListeners();
        print(e);
      }

      if (uid.isNotEmpty) {
        print("----------> $uid");
        if (accountExists == false) {
          //Add firebase doc for user
          await FirebaseFirestore.instance
              .collection("users")
              .doc(uid)
              .set(UserModel(
                      firstName: firstNameTEXT.text,
                      lastName: lastNAmeTEXT.text,
                      email: emailTEXT.text,
                      isVerified: false)
                  .toJson())
              .then((value) => print("User Added"))
              .catchError((error) => print("Failed to add user: $error"));

          //Add shared prefs for user
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setStringList(
            KeyStorage.user,
            [
              firstNameTEXT.text,
              lastNAmeTEXT.text,
              emailTEXT.text,
            ],
          );
          FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
          flutterSecureStorage.write(key: KeyStorage.userUID, value: uid);
          _isLoading = false;
          notifyListeners();
          if (FirebaseAuth.instance.currentUser != null) {
            _context.pushReplacementNamed(
              RoutesStrings.verifyEmail,
              queryParams: {"from": RoutesStrings.signUp},
            );
          }
        } else {
          _isLoading = false;
          notifyListeners();
          return;
        }
      }
    }
  }
}
