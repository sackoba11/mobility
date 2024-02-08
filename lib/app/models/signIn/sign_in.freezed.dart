// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignIn _$SignInFromJson(Map<String, dynamic> json) {
  return _SignIn.fromJson(json);
}

/// @nodoc
mixin _$SignIn {
  String get fullname => throw _privateConstructorUsedError;
  String get numero => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get accountType => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get vehiculeColor => throw _privateConstructorUsedError;
  String get vehiculeNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInCopyWith<SignIn> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInCopyWith<$Res> {
  factory $SignInCopyWith(SignIn value, $Res Function(SignIn) then) =
      _$SignInCopyWithImpl<$Res, SignIn>;
  @useResult
  $Res call(
      {String fullname,
      String numero,
      String email,
      String password,
      String accountType,
      String brand,
      String vehiculeColor,
      String vehiculeNumber});
}

/// @nodoc
class _$SignInCopyWithImpl<$Res, $Val extends SignIn>
    implements $SignInCopyWith<$Res> {
  _$SignInCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullname = null,
    Object? numero = null,
    Object? email = null,
    Object? password = null,
    Object? accountType = null,
    Object? brand = null,
    Object? vehiculeColor = null,
    Object? vehiculeNumber = null,
  }) {
    return _then(_value.copyWith(
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      numero: null == numero
          ? _value.numero
          : numero // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      vehiculeColor: null == vehiculeColor
          ? _value.vehiculeColor
          : vehiculeColor // ignore: cast_nullable_to_non_nullable
              as String,
      vehiculeNumber: null == vehiculeNumber
          ? _value.vehiculeNumber
          : vehiculeNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInImplCopyWith<$Res> implements $SignInCopyWith<$Res> {
  factory _$$SignInImplCopyWith(
          _$SignInImpl value, $Res Function(_$SignInImpl) then) =
      __$$SignInImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullname,
      String numero,
      String email,
      String password,
      String accountType,
      String brand,
      String vehiculeColor,
      String vehiculeNumber});
}

/// @nodoc
class __$$SignInImplCopyWithImpl<$Res>
    extends _$SignInCopyWithImpl<$Res, _$SignInImpl>
    implements _$$SignInImplCopyWith<$Res> {
  __$$SignInImplCopyWithImpl(
      _$SignInImpl _value, $Res Function(_$SignInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullname = null,
    Object? numero = null,
    Object? email = null,
    Object? password = null,
    Object? accountType = null,
    Object? brand = null,
    Object? vehiculeColor = null,
    Object? vehiculeNumber = null,
  }) {
    return _then(_$SignInImpl(
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      numero: null == numero
          ? _value.numero
          : numero // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      vehiculeColor: null == vehiculeColor
          ? _value.vehiculeColor
          : vehiculeColor // ignore: cast_nullable_to_non_nullable
              as String,
      vehiculeNumber: null == vehiculeNumber
          ? _value.vehiculeNumber
          : vehiculeNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInImpl implements _SignIn {
  _$SignInImpl(
      {required this.fullname,
      required this.numero,
      required this.email,
      required this.password,
      required this.accountType,
      required this.brand,
      required this.vehiculeColor,
      required this.vehiculeNumber});

  factory _$SignInImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInImplFromJson(json);

  @override
  final String fullname;
  @override
  final String numero;
  @override
  final String email;
  @override
  final String password;
  @override
  final String accountType;
  @override
  final String brand;
  @override
  final String vehiculeColor;
  @override
  final String vehiculeNumber;

  @override
  String toString() {
    return 'SignIn(fullname: $fullname, numero: $numero, email: $email, password: $password, accountType: $accountType, brand: $brand, vehiculeColor: $vehiculeColor, vehiculeNumber: $vehiculeNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInImpl &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.numero, numero) || other.numero == numero) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.vehiculeColor, vehiculeColor) ||
                other.vehiculeColor == vehiculeColor) &&
            (identical(other.vehiculeNumber, vehiculeNumber) ||
                other.vehiculeNumber == vehiculeNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fullname, numero, email,
      password, accountType, brand, vehiculeColor, vehiculeNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInImplCopyWith<_$SignInImpl> get copyWith =>
      __$$SignInImplCopyWithImpl<_$SignInImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInImplToJson(
      this,
    );
  }
}

abstract class _SignIn implements SignIn {
  factory _SignIn(
      {required final String fullname,
      required final String numero,
      required final String email,
      required final String password,
      required final String accountType,
      required final String brand,
      required final String vehiculeColor,
      required final String vehiculeNumber}) = _$SignInImpl;

  factory _SignIn.fromJson(Map<String, dynamic> json) = _$SignInImpl.fromJson;

  @override
  String get fullname;
  @override
  String get numero;
  @override
  String get email;
  @override
  String get password;
  @override
  String get accountType;
  @override
  String get brand;
  @override
  String get vehiculeColor;
  @override
  String get vehiculeNumber;
  @override
  @JsonKey(ignore: true)
  _$$SignInImplCopyWith<_$SignInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
