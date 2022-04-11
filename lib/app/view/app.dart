// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend/features/counter/counter.dart';
import 'package:frontend/features/home/home.dart';
import 'package:frontend/features/login/login.dart';
import 'package:frontend/features/recover/recover.dart';
import 'package:frontend/features/register/register.dart';
import 'package:frontend/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/',
      routes: {
        // When navigating to the "/counter" route, build the CounterScreen widget.
        '/counter': (context) => const CounterPage(),

        // When navigating to the "/register" route, build the RegisterScreen widget.
        '/register': (context) => const RegisterPage(),

        // When navigating to the "/register" route, build the RegisterScreen widget.
        '/recover': (context) => const RecoverPage(),

        // When navigating to the "/login" route, build the LoginScreen widget.
        '/login': (context) => const LoginPage(),

        // When navigating to the "/home" route, build the HomeScreen widget.
        '/home': (context) => const HomePage(),
        '/': (context) => const HomePage(),
      },
    );
  }
}
