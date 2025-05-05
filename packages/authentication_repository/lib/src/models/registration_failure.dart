import 'package:equatable/equatable.dart';

class RegistrationFailure with EquatableMixin implements Exception {
  const RegistrationFailure(this.errors);

  final Object errors;

  @override
  List<Object> get props => [errors];
}
