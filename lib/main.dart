import 'package:depifinalproject/core/methods/generate_route.dart';
import 'package:depifinalproject/feature/splash/presentation/views/spalsh_view.dart';
import 'package:depifinalproject/generated/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(DevicePreview(enabled: false, builder: (context) => const Flash()));
}

class Flash extends StatelessWidget {
  const Flash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
//new comment