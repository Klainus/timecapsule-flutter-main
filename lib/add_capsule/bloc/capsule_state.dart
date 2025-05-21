part of 'capsule_bloc.dart';

class CreateCapsuleState extends Equatable {
  const CreateCapsuleState({
    this.title = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
  });
  final String title;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  CreateCapsuleState copyWith({
    String? title,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return CreateCapsuleState(
      title: title ?? this.title,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object> get props => [title, isSubmitting, isSuccess, isFailure];
}
