// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateAccountState {
  CreateAccountForm get form => throw _privateConstructorUsedError;
  bool get showIntro => throw _privateConstructorUsedError;

  /// Create a copy of CreateAccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateAccountStateCopyWith<CreateAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAccountStateCopyWith<$Res> {
  factory $CreateAccountStateCopyWith(
          CreateAccountState value, $Res Function(CreateAccountState) then) =
      _$CreateAccountStateCopyWithImpl<$Res, CreateAccountState>;
  @useResult
  $Res call({CreateAccountForm form, bool showIntro});

  $CreateAccountFormCopyWith<$Res> get form;
}

/// @nodoc
class _$CreateAccountStateCopyWithImpl<$Res, $Val extends CreateAccountState>
    implements $CreateAccountStateCopyWith<$Res> {
  _$CreateAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateAccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? showIntro = null,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as CreateAccountForm,
      showIntro: null == showIntro
          ? _value.showIntro
          : showIntro // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of CreateAccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateAccountFormCopyWith<$Res> get form {
    return $CreateAccountFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateAccountStateImplCopyWith<$Res>
    implements $CreateAccountStateCopyWith<$Res> {
  factory _$$CreateAccountStateImplCopyWith(_$CreateAccountStateImpl value,
          $Res Function(_$CreateAccountStateImpl) then) =
      __$$CreateAccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CreateAccountForm form, bool showIntro});

  @override
  $CreateAccountFormCopyWith<$Res> get form;
}

/// @nodoc
class __$$CreateAccountStateImplCopyWithImpl<$Res>
    extends _$CreateAccountStateCopyWithImpl<$Res, _$CreateAccountStateImpl>
    implements _$$CreateAccountStateImplCopyWith<$Res> {
  __$$CreateAccountStateImplCopyWithImpl(_$CreateAccountStateImpl _value,
      $Res Function(_$CreateAccountStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateAccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? showIntro = null,
  }) {
    return _then(_$CreateAccountStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as CreateAccountForm,
      showIntro: null == showIntro
          ? _value.showIntro
          : showIntro // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CreateAccountStateImpl implements _CreateAccountState {
  const _$CreateAccountStateImpl(
      {this.form = const CreateAccountForm(), this.showIntro = false});

  @override
  @JsonKey()
  final CreateAccountForm form;
  @override
  @JsonKey()
  final bool showIntro;

  @override
  String toString() {
    return 'CreateAccountState(form: $form, showIntro: $showIntro)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAccountStateImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.showIntro, showIntro) ||
                other.showIntro == showIntro));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form, showIntro);

  /// Create a copy of CreateAccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAccountStateImplCopyWith<_$CreateAccountStateImpl> get copyWith =>
      __$$CreateAccountStateImplCopyWithImpl<_$CreateAccountStateImpl>(
          this, _$identity);
}

abstract class _CreateAccountState implements CreateAccountState {
  const factory _CreateAccountState(
      {final CreateAccountForm form,
      final bool showIntro}) = _$CreateAccountStateImpl;

  @override
  CreateAccountForm get form;
  @override
  bool get showIntro;

  /// Create a copy of CreateAccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateAccountStateImplCopyWith<_$CreateAccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
