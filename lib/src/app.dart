import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'controllers/searsh_controller.dart';
import 'views/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final SearshController searshController = Get.put(SearshController());

    return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // restorationScopeId: 'app',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          theme: ThemeData(),
          darkTheme: ThemeData.light(),
          // themeMode: settingsController.themeMode,
          home: const SplashView(),
        );
  }
}
