import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/app_constant/providers.dart';
import 'package:workhours/common/resources/theme_manager.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/firebase_options.dart';
import 'package:workhours/generated/l10n.dart';
import 'package:workhours/injections.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return MultiProvider(
            providers: Providers.providers,
            child: Builder(
              builder: (context) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerConfig: Routes.router,
                  theme: applicationTheme,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: const Locale("ar", "EG"),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
