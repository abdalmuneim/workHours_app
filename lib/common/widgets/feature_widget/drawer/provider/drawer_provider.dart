import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';

class DrawerProvider extends ChangeNotifier {
  DrawerProvider() {
    init();
  }
  BuildContext _context = NavigationService.context;

  navTo(String rout) {
    String currentRout = NavigationService.routName;

    if (rout == currentRout) {
      _context.pop();
    } else {
      _context.pushReplacementNamed(rout);
    }
  }

  (TextStyle, Color) getStyle(String rout) {
    String currentRout = NavigationService.routName;
    if (rout == currentRout) {
      return (styleActive, iconActive);
    }
    return (styleNotActive, iconNotActive);
  }

  late TextStyle styleNotActive;
  late Color iconNotActive;
  late Color iconActive;
  late TextStyle styleActive;

  init() {
    styleActive = Theme.of(_context)
        .textTheme
        .bodyMedium!
        .copyWith(color: AppColors.black, fontWeight: FontWeightManger.bold);
    styleNotActive = Theme.of(_context).textTheme.bodyMedium!.copyWith(
        color: AppColors.lightGrey, fontWeight: FontWeightManger.regular);
    iconActive = AppColors.primary;
    iconNotActive = AppColors.lightGrey;
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
