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
import 'package:frontend/features/register/register.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/helpers.dart';

class MockRegisterCubit extends MockCubit<int> implements RegisterCubit {}

void main() {
  group('RegisterPage', () {
    testWidgets('renders RegisterView', (tester) async {
      await tester.pumpApp(const RegisterPage());
      expect(find.byType(RegisterView), findsOneWidget);
    });
  });

  group('RegisterView', () {
    late RegisterCubit registerCubit;

    setUp(() {
      registerCubit = MockRegisterCubit();
    });

    testWidgets('renders current count', (tester) async {
      const state = 42;
      when(() => registerCubit.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(
          value: registerCubit,
          child: const RegisterView(),
        ),
      );
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      when(() => registerCubit.state).thenReturn(0);
      when(() => registerCubit.increment()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: registerCubit,
          child: const RegisterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.add));
      verify(() => registerCubit.increment()).called(1);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      when(() => registerCubit.state).thenReturn(0);
      when(() => registerCubit.decrement()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: registerCubit,
          child: const RegisterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.remove));
      verify(() => registerCubit.decrement()).called(1);
    });
  });
}
