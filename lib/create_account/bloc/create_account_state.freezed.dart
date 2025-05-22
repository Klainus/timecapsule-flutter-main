// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateAccountState {
  CreateAccountForm get form;
  bool get showIntro;

  /// Create a copy of CreateAccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateAccountStateCopyWith<CreateAccountState> get copyWith =>
      _$CreateAccountStateCopyWithImpl<CreateAccountState>(
          this as CreateAccountState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateAccountState &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.showIntro, showIntro) ||
                other.showIntro == showIntro));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form, showIntro);

  @override
  String toString() {
    return 'CreateAccountState(form: $form, showIntro: $showIntro)';
  }
}

/// @nodoc
abstract mixin class $CreateAccountStateCopyWith<$Res> {
  factory $CreateAccountStateCopyWith(
          CreateAccountState value, $Res Function(CreateAccountState) _then) =
      _$CreateAccountStateCopyWithImpl;
  @useResult
  $Res call({CreateAccountForm form, bool showIntro});

  $CreateAccountFormCopyWith<$Res> get form;
}

/// @nodoc
class _$CreateAccountStateCopyWithImpl<$Res>
    implements $CreateAccountStateCopyWith<$Res> {
  _$CreateAccountStateCopyWithImpl(this._self, this._then);

  final CreateAccountState _self;
  final $Res Function(CreateAccountState) _then;

  /// Create a copy of CreateAccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? showIntro = null,
  }) {
    return _then(_self.copyWith(
      form: null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as CreateAccountForm,
      showIntro: null == showIntro
          ? _self.showIntro
          : showIntro // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of CreateAccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateAccountFormCopyWith<$Res> get form {
    return $CreateAccountFormCopyWith<$Res>(_self.form, (value) {
      return _then(_self.copyWith(form: value));
    });
  }
}

/// @nodoc

class _CreateAccountState implements CreateAccountState {
  const _CreateAccountState(
      {this.form = const CreateAccountForm(), this.showIntro = false});

  @override
  @JsonKey()
  final CreateAccountForm form;
  @override
  @JsonKey()
  final bool showIntro;

  /// Create a copy of CreateAccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateAccountStateCopyWith<_CreateAccountState> get copyWith =>
      __$CreateAccountStateCopyWithImpl<_CreateAccountState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateAccountState &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.showIntro, showIntro) ||
                other.showIntro == showIntro));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form, showIntro);

  @override
  String toString() {
    return 'CreateAccountState(form: $form, showIntro: $showIntro)';
  }
}

/// @nodoc
abstract mixin class _$CreateAccountStateCopyWith<$Res>
    implements $CreateAccountStateCopyWith<$Res> {
  factory _$CreateAccountStateCopyWith(
          _CreateAccountState value, $Res Function(_CreateAccountState) _then) =
      __$CreateAccountStateCopyWithImpl;
  @override
  @useResult
  $Res call({CreateAccountForm form, bool showIntro});

  @override
  $CreateAccountFormCopyWith<$Res> get form;
}

/// @nodoc
class __$CreateAccountStateCopyWithImpl<$Res>
    implements _$CreateAccountStateCopyWith<$Res> {
  __$CreateAccountStateCopyWithImpl(this._self, this._then);

  final _CreateAccountState _self;
  final $Res Function(_CreateAccountState) _then;

  /// Create a copy of CreateAccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? form = null,
    Object? showIntro = null,
  }) {
    return _then(_CreateAccountState(
      form: null == form
          ? _self.form
          : form // ignore: cast_nullable_to_non_nullable
              as CreateAccountForm,
      showIntro: null == showIntro
          ? _self.showIntro
          : showIntro // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of CreateAccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateAccountFormCopyWith<$Res> get form {
    return $CreateAccountFormCopyWith<$Res>(_self.form, (value) {
      return _then(_self.copyWith(form: value));
    });
  }
}

// dart format on
