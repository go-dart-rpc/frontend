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
import 'package:frontend/features/recover/recover.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/helpers.dart';

class MockRecoverCubit extends MockCubit<int> implements RecoverCubit {}

void main() {
  group('RecoverPage', () {
    testWidgets('renders RecoverView', (tester) async {
      await tester.pumpApp(const RecoverPage());
      expect(find.byType(RecoverView), findsOneWidget);
    });
  });

  group('RecoverView', () {
    late RecoverCubit recoverCubit;

    setUp(() {
      recoverCubit = MockRecoverCubit();
    });

    testWidgets('renders current count', (tester) async {
      const state = 42;
      when(() => recoverCubit.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(
          value: recoverCubit,
          child: const RecoverView(),
        ),
      );
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      when(() => recoverCubit.state).thenReturn(0);
      when(() => recoverCubit.increment()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: recoverCubit,
          child: const RecoverView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.add));
      verify(() => recoverCubit.increment()).called(1);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      when(() => recoverCubit.state).thenReturn(0);
      when(() => recoverCubit.decrement()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: recoverCubit,
          child: const RecoverView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.remove));
      verify(() => recoverCubit.decrement()).called(1);
    });
  });
}
