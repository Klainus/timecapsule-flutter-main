// ignore_for_file: prefer_const_constructors

import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreateAccountEvent', () {
    group('CreateAccountDataHandlingLinkPressed', () {
      test('has CustomEvent', () {
        expect(
          CreateAccountDataHandlingLinkPressed().event,
          CustomEvent('ca_data_handling_link_pressed'),
        );
      });
    });
  });
}
