import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stage_1/models/user.dart';
import 'package:stage_1/shared/provider/app_storage.dart';
import 'package:stage_1/shared/helper/shared_refs.dart';
import 'config/routes/routes.dart';
import 'config/routes/router.dart' as router;
import 'config/themes/themes.dart';
import 'core/settings/settings_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    if (SharedPrefs.isSignedIn()) {
      AppStorage store = AppStorage();
      store.setUser(User.getSharedRef());
    }
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          localizationsDelegates: const [
            // AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            // Locale('en', 'US'),
            Locale('vi'),
          ],
          onGenerateTitle: (BuildContext context) =>
              'Lạc Dương',// AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(
              primaryColor: LightTheme.darkGreen,
              scaffoldBackgroundColor: LightTheme.white,
              appBarTheme: const AppBarTheme(
                  color: LightTheme.white,
                  elevation: 0,
                  iconTheme: IconThemeData(color: LightTheme.darkGreen)),
              fontFamily: 'avenirnext'),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          initialRoute: SharedPrefs.isSignedIn()
              ? Routes.rootScreen
              : Routes.signInScreen,
          onGenerateRoute: router.Router.generateRoute,
        );
      },
    );
  }
}
