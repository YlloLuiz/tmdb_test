import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:simple_code/simple_code.dart';
import 'package:tmdb_test/bloc/homeBloc.dart';
import 'package:tmdb_test/pages/splashPage.dart';
import 'package:tmdb_test/service/parseService.dart';
import 'package:tmdb_test/utils/info.dart';
import 'package:tmdb_test/utils/themes/defaultTheme.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ParseService.initParse();

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => HomeBloc(),
        ),
      ],
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: SimpleCode.navigatorKey,
      title: appName,
      theme: lightTheme,
      home: SplashPage(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('pt', 'BR'),
      ],
    );
  }
}
