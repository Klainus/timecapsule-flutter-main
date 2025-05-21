part of 'capsule_bloc.dart';

abstract class CreateCapsuleEvent extends Equatable {
  const CreateCapsuleEvent();

  @override
  List<Object> get props => [];
}

class CapsuleTitleChanged extends CreateCapsuleEvent {
  const CapsuleTitleChanged(this.title);
  final String title;

  @override
  List<Object> get props => [title];
}

class CapsuleSubmitted extends CreateCapsuleEvent {}
