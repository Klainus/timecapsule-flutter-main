// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Spacing createSubject({
    double verticalScalingFactor = 16,
    double horizontalScalingFactor = 16,
  }) {
    return Spacing(
      verticalScalingFactor: verticalScalingFactor,
      horizontalScalingFactor: horizontalScalingFactor,
    );
  }

  group('Spacing', () {
    group('quarterVerticalValue', () {
      test('returns a quarter of verticalScalingFactor', () {
        expect(createSubject().quarterVerticalValue, 4);
      });
    });

    group('halfVerticalValue', () {
      test('returns half of verticalScalingFactor', () {
        expect(createSubject().halfVerticalValue, 8);
      });
    });

    group('verticalValue', () {
      test('returns verticalScalingFactor', () {
        expect(createSubject().verticalValue, 16);
      });
    });

    group('doubleVerticalValue', () {
      test('returns double verticalScalingFactor', () {
        expect(createSubject().doubleVerticalValue, 32);
      });
    });

    group('tripleVerticalValue', () {
      test('returns triple verticalScalingFactor', () {
        expect(createSubject().tripleVerticalValue, 48);
      });
    });

    group('quarterHorizontalValue', () {
      test('returns a quarter of horizontalScalingFactor', () {
        expect(createSubject().quarterHorizontalValue, 4);
      });
    });

    group('halfHorizontalValue', () {
      test('returns half of horizontalScalingFactor', () {
        expect(createSubject().halfHorizontalValue, 8);
      });
    });

    group('horizontalValue', () {
      test('returns horizontalScalingFactor', () {
        expect(createSubject().horizontalValue, 16);
      });
    });

    group('doubleHorizontalValue', () {
      test('returns double horizontalScalingFactor', () {
        expect(createSubject().doubleHorizontalValue, 32);
      });
    });

    group('tripleHorizontalValue', () {
      test('returns triple horizontalScalingFactor', () {
        expect(createSubject().tripleHorizontalValue, 48);
      });
    });

    group('verticalValueTimes', () {
      test('returns verticalValue times x', () {
        expect(createSubject().verticalValueTimes(2), 32);
      });
    });

    group('horizontalValueTimes', () {
      test('returns horizontalValue times x', () {
        expect(createSubject().horizontalValueTimes(2), 32);
      });
    });

    group('verticalTimes', () {
      test('returns Padding with bottom set to verticalValue times x', () {
        expect(
          createSubject().verticalTimes(2),
          isA<Padding>().having(
            (padding) => padding.padding,
            'EdgeInsetsGeometry',
            EdgeInsets.only(bottom: 32),
          ),
        );
      });
    });

    group('quarterVertical', () {
      test('returns Padding with bottom set to quarterVerticalValue', () {
        expect(
          createSubject().quarterVertical,
          isA<Padding>().having(
            (padding) => padding.padding,
            'EdgeInsetsGeometry',
            EdgeInsets.only(bottom: 4),
          ),
        );
      });
    });

    group('halfVertical', () {
      test('returns Padding with bottom set to halfVerticalValue', () {
        expect(
          createSubject().halfVertical,
          isA<Padding>().having(
            (padding) => padding.padding,
            'EdgeInsetsGeometry',
            EdgeInsets.only(bottom: 8),
          ),
        );
      });
    });

    group('vertical', () {
      test('returns Padding with bottom set to verticalValue', () {
        expect(
          createSubject().vertical,
          isA<Padding>().having(
            (padding) => padding.padding,
            'EdgeInsetsGeometry',
            EdgeInsets.only(bottom: 16),
          ),
        );
      });
    });

    group('doubleVertical', () {
      test('returns Padding with bottom set to doubleVerticalValue', () {
        expect(
          createSubject().doubleVertical,
          isA<Padding>().having(
            (padding) => padding.padding,
            'EdgeInsetsGeometry',
            EdgeInsets.only(bottom: 32),
          ),
        );
      });
    });

    group('tripleVertical', () {
      test('returns Padding with bottom set to tripleVerticalValue', () {
        expect(
          createSubject().tripleVertical,
          isA<Padding>().having(
            (padding) => padding.padding,
            'EdgeInsetsGeometry',
            EdgeInsets.only(bottom: 48),
          ),
        );
      });
    });

    group('horizontalTimes', () {
      test('returns Padding with right set to horizontalValue times x', () {
        expect(
          createSubject().horizontalTimes(2),
          isA<Padding>().having(
            (padding) => padding.padding,
            'EdgeInsetsGeometry',
            EdgeInsets.only(right: 32),
          ),
        );
      });
    });

    group('quarterHorizontal', () {
      test('returns Padding with right set to quarterHorizontalValue', () {
        expect(
          createSubject().quarterHorizontal,
          isA<Padding>().having(
            (padding) => padding.padding,
            'EdgeInsetsGeometry',
            EdgeInsets.only(right: 4),
          ),
        );
      });
    });

    group('halfHorizontal', () {
      test('returns Padding with right set to halfHorizontalValue', () {
        expect(
          createSubject().halfHorizontal,
          isA<Padding>().having(
            (padding) => padding.padding,
            'EdgeInsetsGeometry',
            EdgeInsets.only(right: 8),
          ),
        );
      });
    });

    group('horizontal', () {
      test('returns Padding with right set to horizontalValue', () {
        expect(
          createSubject().horizontal,
          isA<Padding>().having(
            (padding) => padding.padding,
            'EdgeInsetsGeometry',
            EdgeInsets.only(right: 16),
          ),
        );
      });
    });

    group('doubleHorizontal', () {
      test('returns Padding with right set to doubleHorizontalValue', () {
        expect(
          createSubject().doubleHorizontal,
          isA<Padding>().having(
            (padding) => padding.padding,
            'EdgeInsetsGeometry',
            EdgeInsets.only(right: 32),
          ),
        );
      });
    });

    group('tripleHorizontal', () {
      test('returns Padding with right set to tripleHorizontalValue', () {
        expect(
          createSubject().tripleHorizontal,
          isA<Padding>().having(
            (padding) => padding.padding,
            'EdgeInsetsGeometry',
            EdgeInsets.only(right: 48),
          ),
        );
      });
    });

    group('copyWith', () {
      test('returns Spacing with updated verticalScalingFactor', () {
        expect(
          createSubject().copyWith(verticalScalingFactor: 32),
          isA<Spacing>().having(
            (spacing) => spacing.verticalScalingFactor,
            'verticalScalingFactor',
            32,
          ),
        );
      });

      test('returns Spacing with updated horizontalScalingFactor', () {
        expect(
          createSubject().copyWith(horizontalScalingFactor: 32),
          isA<Spacing>().having(
            (spacing) => spacing.horizontalScalingFactor,
            'horizontalScalingFactor',
            32,
          ),
        );
      });
    });

    group('lerp', () {
      test('returns Spacing with lerped verticalScalingFactor', () {
        final spacing = createSubject();
        final other = createSubject(verticalScalingFactor: 32);

        expect(
          spacing.lerp(other, 0.5),
          isA<Spacing>().having(
            (spacing) => spacing.verticalScalingFactor,
            'verticalScalingFactor',
            24,
          ),
        );
      });

      test('returns Spacing with lerped horizontalScalingFactor', () {
        final spacing = createSubject();
        final other = createSubject(horizontalScalingFactor: 32);

        expect(
          spacing.lerp(other, 0.5),
          isA<Spacing>().having(
            (spacing) => spacing.horizontalScalingFactor,
            'horizontalScalingFactor',
            24,
          ),
        );
      });
    });
  });
}
