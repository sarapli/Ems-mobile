import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/theme/ems_3d_theme.dart';
import 'core/routing/router.dart';

void main() {
  runApp(const EMSApp());
}

class EMSApp extends StatelessWidget {
  const EMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'EMS Sénégal 3D',
      routerConfig: appRouter,
      theme: EMS3DTheme.lightTheme,
      darkTheme: EMS3DTheme.darkTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr', 'FR'),
        Locale('en', 'US'),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
