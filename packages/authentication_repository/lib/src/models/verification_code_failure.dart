import 'package:equatable/equatable.dart';

class VerificationCodeFailure with EquatableMixin implements Exception {
  const VerificationCodeFailure(this.errors);

  final Object errors;

  @override
  List<Object> get props => [errors];
}
