import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/services/network_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class SignInProvider extends ChangeNotifier {
  final NetworkInfo _networkInfo;
  SignInProvider(this._networkInfo);
  final _firebase = FirebaseAuth.instance;
  final GlobalKey<FormState> _globalKey =
      GlobalKey<FormState>(debugLabel: "sig in");
  GlobalKey<FormState> get globalKey => _globalKey;
  final _context = NavigationService.context;

  final emailTEXT = TextEditingController();
  final passwordTEXT = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  signIn() async {
    if (_globalKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();
      try {
        await _firebase.signInWithEmailAndPassword(
            email: emailTEXT.text.trim(), password: passwordTEXT.text.trim());
      } on FirebaseAuthException catch (e) {
        print(e.message);
      } catch (e) {
        print(e);
      }
      print("-------------------------------------");
      print(
          "--------------${_firebase.currentUser!.emailVerified}-----------------------");
      if (_firebase.currentUser != null) {
        if (_firebase.currentUser!.emailVerified) {
          _context.pushReplacementNamed(RoutesStrings.home);
          Utils.showSuccess(S.of(_context).welcomeBack);
        } else {
          _context.pushReplacementNamed(RoutesStrings.verifyEmail,
              queryParams: {"from": RoutesStrings.signIn});
        }
      }
      print("--------------------2-----------------");

      _isLoading = false;
      notifyListeners();
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

  init() async {
    await _listenToNetWork();
  }

  _listenToNetWork() {
    _networkInfo.listenToNetworkStream.onData((bool isConnect) {
      if (isConnect) {
        if (_context.canPop()) {
          _context.pop();
        }
      } else {
        Utils.showLottieDialog(
            lottie: Assets.assetsImagesAnimationsNoConnectionToInternet,
            text: S.of(_context).noInternetConnection);
      }
    });
  }
}
