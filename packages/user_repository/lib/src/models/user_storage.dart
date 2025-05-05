import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:user_repository/user_repository.dart';

class UserStorage extends HydratedCubit<PersistedUserState> {
  UserStorage(this.id) : super(const PersistedUserState());

  @override
  final String id;

  void enableAnalyticsCollection() {
    emit(
      state.copyWith(
        isAnalyticsCollectionEnabled: true,
      ),
    );
  }

  void disableAnalyticsCollection() {
    emit(
      state.copyWith(
        isAnalyticsCollectionEnabled: false,
      ),
    );
  }

  @override
  PersistedUserState fromJson(Map<String, dynamic> json) =>
      PersistedUserState.fromJson(json);

  @override
  Map<String, dynamic> toJson(PersistedUserState state) => state.toJson();
}
