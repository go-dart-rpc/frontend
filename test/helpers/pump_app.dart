// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/l10n/l10n.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: '/',
        routes: {
        // When navigating to the "/counter" route, build the CounterScreen widget.
        '/counter': (context) => widget,

        // When navigating to the "/register" route, build the RegisterScreen widget.
        '/register': (context) => widget,

        // When navigating to the "/register" route, build the RegisterScreen widget.
        '/recover': (context) => widget,

        // When navigating to the "/login" route, build the LoginScreen widget.
        '/login': (context) => widget,

        // When navigating to the "/home" route, build the HomeScreen widget.
        '/home': (context) => widget,
        '/': (context) => widget,
      },
      ),
    );
  }
}
