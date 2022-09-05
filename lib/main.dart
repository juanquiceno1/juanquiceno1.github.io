import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'global_locator.dart';
import 'src/bloc/observer_bloc.dart';
import 'src/pages/splash/splash_screen.dart';
import 'src/routes/routes.dart';
import 'src/utils/preferences/preferences_user.dart';
import 'src/utils/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('assets/google_fonts/Anton/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  await PreferencesUser().initPreferences();
  setUpGlobalLocator();
  BlocOverrides.runZoned(
    () => runApp(
      MyApp(),
    ),
    blocObserver: ObserverBloc(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ResponsiveSizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          title: 'Proservis Cliente',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          initialRoute: SplashScreen.routeName,
          routes: routes,
          // onUnknownRoute: (RouteSettings setting) {
          //   //  String unknownRoute = setting.name ;
          //   return MaterialPageRoute(
          //     builder: (context) => ErrorLoadScreen(),
          //     settings: RouteSettings(
          //       name: ErrorLoadScreen.routeName,
          //     ),
          //   );
          // },
          theme: lightThemeData,
          // darkTheme: darkThemeData,
          // themeMode: EasyDynamicTheme.of(context).themeMode,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('es', 'ES'), // Español
            Locale('en', 'EN'), // Inglés
          ],
          locale: Locale('es', 'ES'),
        ),
      );
}
