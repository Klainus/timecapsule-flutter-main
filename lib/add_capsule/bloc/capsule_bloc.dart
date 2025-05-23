import 'package:as_boilerplate_flutter/add_capsule/models/hive.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'capsule_event.dart';
part 'capsule_state.dart';

class CreateCapsuleBloc extends Bloc<CreateCapsuleEvent, CreateCapsuleState> {
  CreateCapsuleBloc() : super(const CreateCapsuleState()) {
    on<SaveCapsuleEvent>(_onSaveCapsule);
    on<LoadCapsulesEvent>(_onLoadCapsules);
  }

  Future<void> _onSaveCapsule(
    SaveCapsuleEvent event,
    Emitter<CreateCapsuleState> emit,
  ) async {
    try {
      emit(state.copyWith(isSubmitting: true));
      final box = Hive.box<TimeCapsule>('capsules');
      await box.add(event.capsule);
      add(const LoadCapsulesEvent());
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, isFailure: true));
    }
  }

  Future<void> _onLoadCapsules(
    LoadCapsulesEvent event,
    Emitter<CreateCapsuleState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      final box = Hive.box<TimeCapsule>('capsules');
      final capsules = box.values.toList();
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: true,
          title: 'Capsules Loaded',
        ),
      );
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, isFailure: true));
    }
  }
}
