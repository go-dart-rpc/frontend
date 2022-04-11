// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/login/login.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/helpers.dart';

class MockLoginCubit extends MockCubit<int> implements LoginCubit {}

void main() {
  group('LoginPage', () {
    testWidgets('renders LoginView', (tester) async {
      await tester.pumpApp(const LoginPage());
      expect(find.byType(LoginView), findsOneWidget);
    });
  });

  group('LoginView', () {
    late LoginCubit loginCubit;

    setUp(() {
      loginCubit = MockLoginCubit();
    });

    testWidgets('renders current count', (tester) async {
      const state = 42;
      when(() => loginCubit.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(
          value: loginCubit,
          child: const LoginView(),
        ),
      );
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      when(() => loginCubit.state).thenReturn(0);
      when(() => loginCubit.increment()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: loginCubit,
          child: const LoginView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.add));
      verify(() => loginCubit.increment()).called(1);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      when(() => loginCubit.state).thenReturn(0);
      when(() => loginCubit.decrement()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: loginCubit,
          child: const LoginView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.remove));
      verify(() => loginCubit.decrement()).called(1);
    });
  });
}
