part of 'capsule_bloc.dart';

class CreateCapsuleEvent extends Equatable {
  const CreateCapsuleEvent();

  @override
  List<Object?> get props => [];
}

final class SaveCapsuleEvent extends CreateCapsuleEvent {
  const SaveCapsuleEvent(this.capsule);
  final TimeCapsule capsule;

  @override
  List<Object?> get props => [capsule];
}

final class LoadCapsulesEvent extends CreateCapsuleEvent {
  const LoadCapsulesEvent();
}
