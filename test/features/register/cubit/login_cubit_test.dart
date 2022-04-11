// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:frontend/features/register/register.dart';

void main() {
  group('RegisterCubit', () {
    test('initial state is 0', () {
      expect(RegisterCubit().state, equals(0));
    });

    blocTest<RegisterCubit, int>(
      'emits [1] when increment is called',
      build: RegisterCubit.new,
      act: (cubit) => cubit.increment(),
      expect: () => [equals(1)],
    );

    blocTest<RegisterCubit, int>(
      'emits [-1] when decrement is called',
      build: RegisterCubit.new,
      act: (cubit) => cubit.decrement(),
      expect: () => [equals(-1)],
    );
  });
}
