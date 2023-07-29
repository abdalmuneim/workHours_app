import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/features/auth/presentations/views/sign_in_view.dart';
import 'package:workhours/features/auth/presentations/views/sign_up_view.dart';
import 'package:workhours/features/auth/presentations/views/verify_email_view.dart';
import 'package:workhours/features/home/presentations/views/home_view.dart';
import 'package:workhours/features/splash/splash_view.dart';
part './routes_string.dart';

class Routes {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      /// splash
      GoRoute(
        name: RoutesStrings.splash,
        path: RoutesStrings.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      /// signIn
      GoRoute(
        name: RoutesStrings.signIn,
        path: RoutesStrings.signIn,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInView();
        },
      ),

      /// otp
      GoRoute(
        name: RoutesStrings.verifyEmail,
        path: RoutesStrings.verifyEmail,
        builder: (BuildContext context, GoRouterState state) {
          return const VerifyEmailView();
        },
      ),

      /// register
      GoRoute(
        name: RoutesStrings.signUp,
        path: RoutesStrings.signUp,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpView();
        },
      ),

      /// home
      GoRoute(
        name: RoutesStrings.home,
        path: RoutesStrings.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
    ],
  );
}
