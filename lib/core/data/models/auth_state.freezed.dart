// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String? message) authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(AppException exception) error,
    required TResult Function(String email) emailVerificationRequired,
    required TResult Function(String phoneNumber, String verificationId)
        phoneVerificationRequired,
    required TResult Function(UserModel partialUser) profileSetupRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function(String? message)? authenticating,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(AppException exception)? error,
    TResult? Function(String email)? emailVerificationRequired,
    TResult? Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult? Function(UserModel partialUser)? profileSetupRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String? message)? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function(AppException exception)? error,
    TResult Function(String email)? emailVerificationRequired,
    TResult Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult Function(UserModel partialUser)? profileSetupRequired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(EmailVerificationRequired value)
        emailVerificationRequired,
    required TResult Function(PhoneVerificationRequired value)
        phoneVerificationRequired,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Authenticating value)? authenticating,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult? Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    TResult Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(_$UnauthenticatedImpl value,
          $Res Function(_$UnauthenticatedImpl) then) =
      __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
      _$UnauthenticatedImpl _value, $Res Function(_$UnauthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthenticatedImpl implements Unauthenticated {
  const _$UnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String? message) authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(AppException exception) error,
    required TResult Function(String email) emailVerificationRequired,
    required TResult Function(String phoneNumber, String verificationId)
        phoneVerificationRequired,
    required TResult Function(UserModel partialUser) profileSetupRequired,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function(String? message)? authenticating,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(AppException exception)? error,
    TResult? Function(String email)? emailVerificationRequired,
    TResult? Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult? Function(UserModel partialUser)? profileSetupRequired,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String? message)? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function(AppException exception)? error,
    TResult Function(String email)? emailVerificationRequired,
    TResult Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult Function(UserModel partialUser)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(EmailVerificationRequired value)
        emailVerificationRequired,
    required TResult Function(PhoneVerificationRequired value)
        phoneVerificationRequired,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Authenticating value)? authenticating,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult? Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    TResult Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  const factory Unauthenticated() = _$UnauthenticatedImpl;
}

/// @nodoc
abstract class _$$AuthenticatingImplCopyWith<$Res> {
  factory _$$AuthenticatingImplCopyWith(_$AuthenticatingImpl value,
          $Res Function(_$AuthenticatingImpl) then) =
      __$$AuthenticatingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$AuthenticatingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatingImpl>
    implements _$$AuthenticatingImplCopyWith<$Res> {
  __$$AuthenticatingImplCopyWithImpl(
      _$AuthenticatingImpl _value, $Res Function(_$AuthenticatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$AuthenticatingImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthenticatingImpl implements Authenticating {
  const _$AuthenticatingImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'AuthState.authenticating(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatingImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatingImplCopyWith<_$AuthenticatingImpl> get copyWith =>
      __$$AuthenticatingImplCopyWithImpl<_$AuthenticatingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String? message) authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(AppException exception) error,
    required TResult Function(String email) emailVerificationRequired,
    required TResult Function(String phoneNumber, String verificationId)
        phoneVerificationRequired,
    required TResult Function(UserModel partialUser) profileSetupRequired,
  }) {
    return authenticating(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function(String? message)? authenticating,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(AppException exception)? error,
    TResult? Function(String email)? emailVerificationRequired,
    TResult? Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult? Function(UserModel partialUser)? profileSetupRequired,
  }) {
    return authenticating?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String? message)? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function(AppException exception)? error,
    TResult Function(String email)? emailVerificationRequired,
    TResult Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult Function(UserModel partialUser)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(EmailVerificationRequired value)
        emailVerificationRequired,
    required TResult Function(PhoneVerificationRequired value)
        phoneVerificationRequired,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
  }) {
    return authenticating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Authenticating value)? authenticating,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult? Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
  }) {
    return authenticating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    TResult Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(this);
    }
    return orElse();
  }
}

abstract class Authenticating implements AuthState {
  const factory Authenticating({final String? message}) = _$AuthenticatingImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$AuthenticatingImplCopyWith<_$AuthenticatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthenticatedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthenticatedImpl implements Authenticated {
  const _$AuthenticatedImpl(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String? message) authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(AppException exception) error,
    required TResult Function(String email) emailVerificationRequired,
    required TResult Function(String phoneNumber, String verificationId)
        phoneVerificationRequired,
    required TResult Function(UserModel partialUser) profileSetupRequired,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function(String? message)? authenticating,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(AppException exception)? error,
    TResult? Function(String email)? emailVerificationRequired,
    TResult? Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult? Function(UserModel partialUser)? profileSetupRequired,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String? message)? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function(AppException exception)? error,
    TResult Function(String email)? emailVerificationRequired,
    TResult Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult Function(UserModel partialUser)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(EmailVerificationRequired value)
        emailVerificationRequired,
    required TResult Function(PhoneVerificationRequired value)
        phoneVerificationRequired,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Authenticating value)? authenticating,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult? Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    TResult Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated(final UserModel user) = _$AuthenticatedImpl;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
          _$AuthErrorImpl value, $Res Function(_$AuthErrorImpl) then) =
      __$$AuthErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException exception});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
      _$AuthErrorImpl _value, $Res Function(_$AuthErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$AuthErrorImpl(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$AuthErrorImpl implements AuthError {
  const _$AuthErrorImpl(this.exception);

  @override
  final AppException exception;

  @override
  String toString() {
    return 'AuthState.error(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String? message) authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(AppException exception) error,
    required TResult Function(String email) emailVerificationRequired,
    required TResult Function(String phoneNumber, String verificationId)
        phoneVerificationRequired,
    required TResult Function(UserModel partialUser) profileSetupRequired,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function(String? message)? authenticating,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(AppException exception)? error,
    TResult? Function(String email)? emailVerificationRequired,
    TResult? Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult? Function(UserModel partialUser)? profileSetupRequired,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String? message)? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function(AppException exception)? error,
    TResult Function(String email)? emailVerificationRequired,
    TResult Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult Function(UserModel partialUser)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(EmailVerificationRequired value)
        emailVerificationRequired,
    required TResult Function(PhoneVerificationRequired value)
        phoneVerificationRequired,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Authenticating value)? authenticating,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult? Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    TResult Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthError implements AuthState {
  const factory AuthError(final AppException exception) = _$AuthErrorImpl;

  AppException get exception;
  @JsonKey(ignore: true)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailVerificationRequiredImplCopyWith<$Res> {
  factory _$$EmailVerificationRequiredImplCopyWith(
          _$EmailVerificationRequiredImpl value,
          $Res Function(_$EmailVerificationRequiredImpl) then) =
      __$$EmailVerificationRequiredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailVerificationRequiredImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$EmailVerificationRequiredImpl>
    implements _$$EmailVerificationRequiredImplCopyWith<$Res> {
  __$$EmailVerificationRequiredImplCopyWithImpl(
      _$EmailVerificationRequiredImpl _value,
      $Res Function(_$EmailVerificationRequiredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailVerificationRequiredImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailVerificationRequiredImpl implements EmailVerificationRequired {
  const _$EmailVerificationRequiredImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'AuthState.emailVerificationRequired(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationRequiredImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationRequiredImplCopyWith<_$EmailVerificationRequiredImpl>
      get copyWith => __$$EmailVerificationRequiredImplCopyWithImpl<
          _$EmailVerificationRequiredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String? message) authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(AppException exception) error,
    required TResult Function(String email) emailVerificationRequired,
    required TResult Function(String phoneNumber, String verificationId)
        phoneVerificationRequired,
    required TResult Function(UserModel partialUser) profileSetupRequired,
  }) {
    return emailVerificationRequired(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function(String? message)? authenticating,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(AppException exception)? error,
    TResult? Function(String email)? emailVerificationRequired,
    TResult? Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult? Function(UserModel partialUser)? profileSetupRequired,
  }) {
    return emailVerificationRequired?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String? message)? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function(AppException exception)? error,
    TResult Function(String email)? emailVerificationRequired,
    TResult Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult Function(UserModel partialUser)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (emailVerificationRequired != null) {
      return emailVerificationRequired(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(EmailVerificationRequired value)
        emailVerificationRequired,
    required TResult Function(PhoneVerificationRequired value)
        phoneVerificationRequired,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
  }) {
    return emailVerificationRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Authenticating value)? authenticating,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult? Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
  }) {
    return emailVerificationRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    TResult Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (emailVerificationRequired != null) {
      return emailVerificationRequired(this);
    }
    return orElse();
  }
}

abstract class EmailVerificationRequired implements AuthState {
  const factory EmailVerificationRequired(final String email) =
      _$EmailVerificationRequiredImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$EmailVerificationRequiredImplCopyWith<_$EmailVerificationRequiredImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneVerificationRequiredImplCopyWith<$Res> {
  factory _$$PhoneVerificationRequiredImplCopyWith(
          _$PhoneVerificationRequiredImpl value,
          $Res Function(_$PhoneVerificationRequiredImpl) then) =
      __$$PhoneVerificationRequiredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, String verificationId});
}

/// @nodoc
class __$$PhoneVerificationRequiredImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$PhoneVerificationRequiredImpl>
    implements _$$PhoneVerificationRequiredImplCopyWith<$Res> {
  __$$PhoneVerificationRequiredImplCopyWithImpl(
      _$PhoneVerificationRequiredImpl _value,
      $Res Function(_$PhoneVerificationRequiredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? verificationId = null,
  }) {
    return _then(_$PhoneVerificationRequiredImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneVerificationRequiredImpl implements PhoneVerificationRequired {
  const _$PhoneVerificationRequiredImpl(
      {required this.phoneNumber, required this.verificationId});

  @override
  final String phoneNumber;
  @override
  final String verificationId;

  @override
  String toString() {
    return 'AuthState.phoneVerificationRequired(phoneNumber: $phoneNumber, verificationId: $verificationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneVerificationRequiredImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, verificationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneVerificationRequiredImplCopyWith<_$PhoneVerificationRequiredImpl>
      get copyWith => __$$PhoneVerificationRequiredImplCopyWithImpl<
          _$PhoneVerificationRequiredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String? message) authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(AppException exception) error,
    required TResult Function(String email) emailVerificationRequired,
    required TResult Function(String phoneNumber, String verificationId)
        phoneVerificationRequired,
    required TResult Function(UserModel partialUser) profileSetupRequired,
  }) {
    return phoneVerificationRequired(phoneNumber, verificationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function(String? message)? authenticating,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(AppException exception)? error,
    TResult? Function(String email)? emailVerificationRequired,
    TResult? Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult? Function(UserModel partialUser)? profileSetupRequired,
  }) {
    return phoneVerificationRequired?.call(phoneNumber, verificationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String? message)? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function(AppException exception)? error,
    TResult Function(String email)? emailVerificationRequired,
    TResult Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult Function(UserModel partialUser)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (phoneVerificationRequired != null) {
      return phoneVerificationRequired(phoneNumber, verificationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(EmailVerificationRequired value)
        emailVerificationRequired,
    required TResult Function(PhoneVerificationRequired value)
        phoneVerificationRequired,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
  }) {
    return phoneVerificationRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Authenticating value)? authenticating,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult? Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
  }) {
    return phoneVerificationRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    TResult Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (phoneVerificationRequired != null) {
      return phoneVerificationRequired(this);
    }
    return orElse();
  }
}

abstract class PhoneVerificationRequired implements AuthState {
  const factory PhoneVerificationRequired(
      {required final String phoneNumber,
      required final String verificationId}) = _$PhoneVerificationRequiredImpl;

  String get phoneNumber;
  String get verificationId;
  @JsonKey(ignore: true)
  _$$PhoneVerificationRequiredImplCopyWith<_$PhoneVerificationRequiredImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileSetupRequiredImplCopyWith<$Res> {
  factory _$$ProfileSetupRequiredImplCopyWith(_$ProfileSetupRequiredImpl value,
          $Res Function(_$ProfileSetupRequiredImpl) then) =
      __$$ProfileSetupRequiredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel partialUser});

  $UserModelCopyWith<$Res> get partialUser;
}

/// @nodoc
class __$$ProfileSetupRequiredImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ProfileSetupRequiredImpl>
    implements _$$ProfileSetupRequiredImplCopyWith<$Res> {
  __$$ProfileSetupRequiredImplCopyWithImpl(_$ProfileSetupRequiredImpl _value,
      $Res Function(_$ProfileSetupRequiredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partialUser = null,
  }) {
    return _then(_$ProfileSetupRequiredImpl(
      null == partialUser
          ? _value.partialUser
          : partialUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get partialUser {
    return $UserModelCopyWith<$Res>(_value.partialUser, (value) {
      return _then(_value.copyWith(partialUser: value));
    });
  }
}

/// @nodoc

class _$ProfileSetupRequiredImpl implements ProfileSetupRequired {
  const _$ProfileSetupRequiredImpl(this.partialUser);

  @override
  final UserModel partialUser;

  @override
  String toString() {
    return 'AuthState.profileSetupRequired(partialUser: $partialUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSetupRequiredImpl &&
            (identical(other.partialUser, partialUser) ||
                other.partialUser == partialUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partialUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSetupRequiredImplCopyWith<_$ProfileSetupRequiredImpl>
      get copyWith =>
          __$$ProfileSetupRequiredImplCopyWithImpl<_$ProfileSetupRequiredImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String? message) authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function(AppException exception) error,
    required TResult Function(String email) emailVerificationRequired,
    required TResult Function(String phoneNumber, String verificationId)
        phoneVerificationRequired,
    required TResult Function(UserModel partialUser) profileSetupRequired,
  }) {
    return profileSetupRequired(partialUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function(String? message)? authenticating,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function(AppException exception)? error,
    TResult? Function(String email)? emailVerificationRequired,
    TResult? Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult? Function(UserModel partialUser)? profileSetupRequired,
  }) {
    return profileSetupRequired?.call(partialUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String? message)? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function(AppException exception)? error,
    TResult Function(String email)? emailVerificationRequired,
    TResult Function(String phoneNumber, String verificationId)?
        phoneVerificationRequired,
    TResult Function(UserModel partialUser)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (profileSetupRequired != null) {
      return profileSetupRequired(partialUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticating value) authenticating,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(EmailVerificationRequired value)
        emailVerificationRequired,
    required TResult Function(PhoneVerificationRequired value)
        phoneVerificationRequired,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
  }) {
    return profileSetupRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Authenticating value)? authenticating,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult? Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
  }) {
    return profileSetupRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticating value)? authenticating,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    TResult Function(EmailVerificationRequired value)?
        emailVerificationRequired,
    TResult Function(PhoneVerificationRequired value)?
        phoneVerificationRequired,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    required TResult orElse(),
  }) {
    if (profileSetupRequired != null) {
      return profileSetupRequired(this);
    }
    return orElse();
  }
}

abstract class ProfileSetupRequired implements AuthState {
  const factory ProfileSetupRequired(final UserModel partialUser) =
      _$ProfileSetupRequiredImpl;

  UserModel get partialUser;
  @JsonKey(ignore: true)
  _$$ProfileSetupRequiredImplCopyWith<_$ProfileSetupRequiredImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel? user, String? message) success,
    required TResult Function(AppException exception) error,
    required TResult Function(AuthActionType actionType,
            Map<String, dynamic>? data, String? message)
        requiresAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel? user, String? message)? success,
    TResult? Function(AppException exception)? error,
    TResult? Function(AuthActionType actionType, Map<String, dynamic>? data,
            String? message)?
        requiresAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel? user, String? message)? success,
    TResult Function(AppException exception)? error,
    TResult Function(AuthActionType actionType, Map<String, dynamic>? data,
            String? message)?
        requiresAction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthResultError value) error,
    required TResult Function(AuthRequiresAction value) requiresAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthResultError value)? error,
    TResult? Function(AuthRequiresAction value)? requiresAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthResultError value)? error,
    TResult Function(AuthRequiresAction value)? requiresAction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResultCopyWith<$Res> {
  factory $AuthResultCopyWith(
          AuthResult value, $Res Function(AuthResult) then) =
      _$AuthResultCopyWithImpl<$Res, AuthResult>;
}

/// @nodoc
class _$AuthResultCopyWithImpl<$Res, $Val extends AuthResult>
    implements $AuthResultCopyWith<$Res> {
  _$AuthResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthSuccessImplCopyWith<$Res> {
  factory _$$AuthSuccessImplCopyWith(
          _$AuthSuccessImpl value, $Res Function(_$AuthSuccessImpl) then) =
      __$$AuthSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel? user, String? message});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthSuccessImplCopyWithImpl<$Res>
    extends _$AuthResultCopyWithImpl<$Res, _$AuthSuccessImpl>
    implements _$$AuthSuccessImplCopyWith<$Res> {
  __$$AuthSuccessImplCopyWithImpl(
      _$AuthSuccessImpl _value, $Res Function(_$AuthSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? message = freezed,
  }) {
    return _then(_$AuthSuccessImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthSuccessImpl implements AuthSuccess {
  const _$AuthSuccessImpl({this.user, this.message});

  @override
  final UserModel? user;
  @override
  final String? message;

  @override
  String toString() {
    return 'AuthResult.success(user: $user, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSuccessImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSuccessImplCopyWith<_$AuthSuccessImpl> get copyWith =>
      __$$AuthSuccessImplCopyWithImpl<_$AuthSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel? user, String? message) success,
    required TResult Function(AppException exception) error,
    required TResult Function(AuthActionType actionType,
            Map<String, dynamic>? data, String? message)
        requiresAction,
  }) {
    return success(user, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel? user, String? message)? success,
    TResult? Function(AppException exception)? error,
    TResult? Function(AuthActionType actionType, Map<String, dynamic>? data,
            String? message)?
        requiresAction,
  }) {
    return success?.call(user, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel? user, String? message)? success,
    TResult Function(AppException exception)? error,
    TResult Function(AuthActionType actionType, Map<String, dynamic>? data,
            String? message)?
        requiresAction,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthResultError value) error,
    required TResult Function(AuthRequiresAction value) requiresAction,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthResultError value)? error,
    TResult? Function(AuthRequiresAction value)? requiresAction,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthResultError value)? error,
    TResult Function(AuthRequiresAction value)? requiresAction,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AuthSuccess implements AuthResult {
  const factory AuthSuccess({final UserModel? user, final String? message}) =
      _$AuthSuccessImpl;

  UserModel? get user;
  String? get message;
  @JsonKey(ignore: true)
  _$$AuthSuccessImplCopyWith<_$AuthSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthResultErrorImplCopyWith<$Res> {
  factory _$$AuthResultErrorImplCopyWith(_$AuthResultErrorImpl value,
          $Res Function(_$AuthResultErrorImpl) then) =
      __$$AuthResultErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException exception});
}

/// @nodoc
class __$$AuthResultErrorImplCopyWithImpl<$Res>
    extends _$AuthResultCopyWithImpl<$Res, _$AuthResultErrorImpl>
    implements _$$AuthResultErrorImplCopyWith<$Res> {
  __$$AuthResultErrorImplCopyWithImpl(
      _$AuthResultErrorImpl _value, $Res Function(_$AuthResultErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$AuthResultErrorImpl(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$AuthResultErrorImpl implements AuthResultError {
  const _$AuthResultErrorImpl(this.exception);

  @override
  final AppException exception;

  @override
  String toString() {
    return 'AuthResult.error(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResultErrorImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResultErrorImplCopyWith<_$AuthResultErrorImpl> get copyWith =>
      __$$AuthResultErrorImplCopyWithImpl<_$AuthResultErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel? user, String? message) success,
    required TResult Function(AppException exception) error,
    required TResult Function(AuthActionType actionType,
            Map<String, dynamic>? data, String? message)
        requiresAction,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel? user, String? message)? success,
    TResult? Function(AppException exception)? error,
    TResult? Function(AuthActionType actionType, Map<String, dynamic>? data,
            String? message)?
        requiresAction,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel? user, String? message)? success,
    TResult Function(AppException exception)? error,
    TResult Function(AuthActionType actionType, Map<String, dynamic>? data,
            String? message)?
        requiresAction,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthResultError value) error,
    required TResult Function(AuthRequiresAction value) requiresAction,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthResultError value)? error,
    TResult? Function(AuthRequiresAction value)? requiresAction,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthResultError value)? error,
    TResult Function(AuthRequiresAction value)? requiresAction,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthResultError implements AuthResult {
  const factory AuthResultError(final AppException exception) =
      _$AuthResultErrorImpl;

  AppException get exception;
  @JsonKey(ignore: true)
  _$$AuthResultErrorImplCopyWith<_$AuthResultErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthRequiresActionImplCopyWith<$Res> {
  factory _$$AuthRequiresActionImplCopyWith(_$AuthRequiresActionImpl value,
          $Res Function(_$AuthRequiresActionImpl) then) =
      __$$AuthRequiresActionImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {AuthActionType actionType, Map<String, dynamic>? data, String? message});
}

/// @nodoc
class __$$AuthRequiresActionImplCopyWithImpl<$Res>
    extends _$AuthResultCopyWithImpl<$Res, _$AuthRequiresActionImpl>
    implements _$$AuthRequiresActionImplCopyWith<$Res> {
  __$$AuthRequiresActionImplCopyWithImpl(_$AuthRequiresActionImpl _value,
      $Res Function(_$AuthRequiresActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionType = null,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$AuthRequiresActionImpl(
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as AuthActionType,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthRequiresActionImpl implements AuthRequiresAction {
  const _$AuthRequiresActionImpl(
      {required this.actionType,
      final Map<String, dynamic>? data,
      this.message})
      : _data = data;

  @override
  final AuthActionType actionType;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'AuthResult.requiresAction(actionType: $actionType, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthRequiresActionImpl &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actionType,
      const DeepCollectionEquality().hash(_data), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthRequiresActionImplCopyWith<_$AuthRequiresActionImpl> get copyWith =>
      __$$AuthRequiresActionImplCopyWithImpl<_$AuthRequiresActionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel? user, String? message) success,
    required TResult Function(AppException exception) error,
    required TResult Function(AuthActionType actionType,
            Map<String, dynamic>? data, String? message)
        requiresAction,
  }) {
    return requiresAction(actionType, data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel? user, String? message)? success,
    TResult? Function(AppException exception)? error,
    TResult? Function(AuthActionType actionType, Map<String, dynamic>? data,
            String? message)?
        requiresAction,
  }) {
    return requiresAction?.call(actionType, data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel? user, String? message)? success,
    TResult Function(AppException exception)? error,
    TResult Function(AuthActionType actionType, Map<String, dynamic>? data,
            String? message)?
        requiresAction,
    required TResult orElse(),
  }) {
    if (requiresAction != null) {
      return requiresAction(actionType, data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthResultError value) error,
    required TResult Function(AuthRequiresAction value) requiresAction,
  }) {
    return requiresAction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthResultError value)? error,
    TResult? Function(AuthRequiresAction value)? requiresAction,
  }) {
    return requiresAction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthResultError value)? error,
    TResult Function(AuthRequiresAction value)? requiresAction,
    required TResult orElse(),
  }) {
    if (requiresAction != null) {
      return requiresAction(this);
    }
    return orElse();
  }
}

abstract class AuthRequiresAction implements AuthResult {
  const factory AuthRequiresAction(
      {required final AuthActionType actionType,
      final Map<String, dynamic>? data,
      final String? message}) = _$AuthRequiresActionImpl;

  AuthActionType get actionType;
  Map<String, dynamic>? get data;
  String? get message;
  @JsonKey(ignore: true)
  _$$AuthRequiresActionImplCopyWith<_$AuthRequiresActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
