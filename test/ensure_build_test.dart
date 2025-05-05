import 'package:build_verify/build_verify.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'ensure_build',
    () => expectBuildClean(
      gitDiffPathArguments: [':!pubspec.lock'],
    ),
    timeout: const Timeout(
      Duration(minutes: 2),
    ),
    // This test should be run in CI separately from other tests.
    // It checks that committed generated files are up-to-date.
    skip: true,
  );
}
