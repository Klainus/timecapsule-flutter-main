import 'package:analytics_repository/analytics_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'capsule_event.dart';
part 'capsule_state.dart';

class CreateCapsuleBloc extends Bloc<CreateCapsuleEvent, CreateCapsuleState> {
  CreateCapsuleBloc({this.analyticsRepository})
      : super(const CreateCapsuleState()) {
    on<CapsuleTitleChanged>(_onTitleChanged);
    on<CapsuleSubmitted>(_onSubmitted);
  }
  final AnalyticsRepository? analyticsRepository;

  void _onTitleChanged(
    CapsuleTitleChanged event,
    Emitter<CreateCapsuleState> emit,
  ) {
    emit(
      state.copyWith(
        title: event.title,
      ),
    );
  }

  Future<void> _onSubmitted(
    CapsuleSubmitted event,
    Emitter<CreateCapsuleState> emit,
  ) async {
    emit(
      state.copyWith(isSubmitting: true, isFailure: false, isSuccess: false),
    );

    try {
      // TODO: Call your API to create a capsule here
      await Future.delayed(const Duration(seconds: 2));

      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (_) {
      emit(state.copyWith(isSubmitting: false, isFailure: true));
    }
  }
}
