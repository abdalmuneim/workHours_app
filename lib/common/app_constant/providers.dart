import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:workhours/features/auth/presentations/providers/sign_in_provider.dart';
import 'package:workhours/features/auth/presentations/providers/sign_up_provider.dart';
import 'package:workhours/features/auth/presentations/providers/verify_email_provider.dart';
import 'package:workhours/features/home/presentations/providers/home_provider.dart';
import 'package:workhours/features/splash/splash_provider.dart';
import 'package:workhours/injections.dart';

class Providers {
  static List<SingleChildWidget> providers = [
    /// SplashProvider
    ChangeNotifierProvider(create: (_) => SplashProvider(sl())),

    /// signIn Provider
    ChangeNotifierProvider(create: (_) => SignInProvider()),

    /// SignUpProvider
    ChangeNotifierProvider(create: (_) => SignUpProvider()),

    /// VerifyEmailProvider
    ChangeNotifierProvider(create: (_) => VerifyEmailProvider()),

    /// HomeProvider
    ChangeNotifierProvider(create: (_) => HomeProvider()),

    /// FamilyMembersProvider
    // ChangeNotifierProvider(create: (_) => FamilyMembersProvider(sl())),

    /// Add MemberProvider
    // ChangeNotifierProvider(create: (_) => AddMemberProvider(sl())),

    /// edit MemberProvider
    // ChangeNotifierProvider(create: (_) => EditMemberProvider(sl())),

    /// notification Provider
    // ChangeNotifierProvider(create: (_) => NotificationProvider(sl())),
  ];
}
