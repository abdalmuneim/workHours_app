import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/features/connect_with_us/connect_with_us_view.dart';
import 'package:workhours/features/profile/presentations/views/change_password_view.dart';
import 'package:workhours/features/auth/presentations/views/forget_password_view.dart';
import 'package:workhours/features/auth/presentations/views/new_password_view.dart';
import 'package:workhours/features/auth/presentations/views/sign_in_view.dart';
import 'package:workhours/features/auth/presentations/views/sign_up_view.dart';
import 'package:workhours/features/auth/presentations/views/verify_email_view.dart';
import 'package:workhours/features/create_list/presentations/views/form_create_list_view.dart';
import 'package:workhours/features/create_list/presentations/views/list_of_employees_view.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';
import 'package:workhours/features/home/presentations/views/edit_employee_view.dart';
import 'package:workhours/features/home/presentations/views/home_view.dart';
import 'package:workhours/features/home/presentations/views/new_employee_view.dart';
import 'package:workhours/features/profile/presentations/views/profile_view.dart';
import 'package:workhours/features/splash/splash_view.dart';
part './routes_string.dart';

class Routes {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      /// splash
      GoRoute(
        name: RoutesStrings.initial,
        path: RoutesStrings.initial,
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

      /// verifyEmail
      GoRoute(
        name: RoutesStrings.verifyEmail,
        path: RoutesStrings.verifyEmail,
        builder: (BuildContext context, GoRouterState state) {
          final String fromScreen = state.queryParams["from"]!;
          log("----------->${fromScreen}");
          return VerifyEmailView(
            fromScreen: fromScreen,
          );
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

      /// new employee
      GoRoute(
        name: RoutesStrings.newEmployee,
        path: RoutesStrings.newEmployee,
        builder: (BuildContext context, GoRouterState state) {
          int numOfEmp = int.parse(state.queryParams["numOfEmp"]!);
          return NewEmployeeView(
            numOfEmp: numOfEmp,
          );
        },
      ),

      /// edit employee
      GoRoute(
        name: RoutesStrings.editEmployee,
        path: RoutesStrings.editEmployee,
        builder: (BuildContext context, GoRouterState state) {
          final EmployeeModel employee =
              EmployeeModel.fromJson(state.queryParams["employee"]!);
          int numOfEmp = int.parse(state.queryParams["numOfEmp"]!);
          return EditEmployeeView(
            employee: employee,
            numOfEmp: numOfEmp,
          );
        },
      ),

      /// createList
      GoRoute(
        name: RoutesStrings.createList,
        path: RoutesStrings.createList,
        builder: (BuildContext context, GoRouterState state) {
          List<EmployeeModel> employees = state.extra as List<EmployeeModel>;
          log(employees.length.toString());

          // List<EmployeeModel> genres = employees.map((item) => item as EmployeeModel).toList();
          return CreateListView(
            employees: employees,
          );
        },
      ),

      /// createdListEmployees
      GoRoute(
        name: RoutesStrings.listOfEmployees,
        path: RoutesStrings.listOfEmployees,
        builder: (BuildContext context, GoRouterState state) {
          List<EmployeeModel> employees = state.extra as List<EmployeeModel>;
          log(employees.length.toString());
          // List<EmployeeModel> genres = employees.map((item) => item as EmployeeModel).toList();
          return ListOfEmployeesView(
            employees: employees,
          );
        },
      ),

      /// ForgetPasswordView
      GoRoute(
        name: RoutesStrings.forgetPassword,
        path: RoutesStrings.forgetPassword,
        builder: (BuildContext context, GoRouterState state) {
          return const ForgetPasswordView();
        },
      ),

      /// newPassword
      GoRoute(
        name: RoutesStrings.newPassword,
        path: RoutesStrings.newPassword,
        builder: (BuildContext context, GoRouterState state) {
          return const NewPasswordView();
        },
      ),

      /// profile
      GoRoute(
        name: RoutesStrings.profile,
        path: RoutesStrings.profile,
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileView();
        },
      ),

      /// changePassword
      GoRoute(
        name: RoutesStrings.changePassword,
        path: RoutesStrings.changePassword,
        builder: (BuildContext context, GoRouterState state) {
          return const ChangePasswordView();
        },
      ),

      /// changePassword
      GoRoute(
        name: RoutesStrings.callUs,
        path: RoutesStrings.callUs,
        builder: (BuildContext context, GoRouterState state) {
          return const ConnectWithUsView();
        },
      ),
    ],
  );
}
