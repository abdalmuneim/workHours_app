import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:workhours/common/widgets/feature_widget/filter_by_group/provider/bottom_sheet_filter_by_group_provider.dart';
import 'package:workhours/features/auth/presentations/providers/sign_in_provider.dart';
import 'package:workhours/features/auth/presentations/providers/sign_up_provider.dart';
import 'package:workhours/features/auth/presentations/providers/verify_email_provider.dart';
import 'package:workhours/features/create_list/presentations/providers/create_list_provider.dart';
import 'package:workhours/features/create_list/presentations/providers/list_of_employees_provider.dart';
import 'package:workhours/features/home/presentations/providers/home_provider.dart';
import 'package:workhours/features/splash/splash_provider.dart';
import 'package:workhours/injections.dart';

class Providers {
  static List<SingleChildWidget> providers = [
    // --------------------------- start Screens Providers-----------------------------
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

    /// createListProvider
    ChangeNotifierProvider(create: (_) => CreateListProvider()),

    /// createdListEmployees provider
    ChangeNotifierProvider(create: (_) => ListOfEmployeesProvider()),

    /// edit MemberProvider
    // ChangeNotifierProvider(create: (_) => EditMemberProvider(sl())),

    /// notification Provider
    // ChangeNotifierProvider(create: (_) => NotificationProvider(sl())),

    // ----------------------------- End Screen Providers ---------------------------

    // ---------------------------- Start Component providers ----------------------

    /// bottom sheet filter be group provider
    ChangeNotifierProvider(create: (_) => BottomSheetFilterByGroupProvider()),
  ];
}
