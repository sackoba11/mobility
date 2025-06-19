// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignIn {
  String get fullname;
  String get numero;
  String get email;
  String get password;
  String get accountType;
  String get brand;
  String get vehiculeColor;
  String get vehiculeNumber;

  /// Create a copy of SignIn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInCopyWith<SignIn> get copyWith =>
      _$SignInCopyWithImpl<SignIn>(this as SignIn, _$identity);

  /// Serializes this SignIn to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignIn &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullname, numero, email,
      password, accountType, brand, vehiculeColor, vehiculeNumber);

  @override
  String toString() {
    return 'SignIn(fullname: $fullname, numero: $numero, email: $email, password: $password, accountType: $accountType, brand: $brand, vehiculeColor: $vehiculeColor, vehiculeNumber: $vehiculeNumber)';
  }
}

/// @nodoc
abstract mixin class $SignInCopyWith<$Res> {
  factory $SignInCopyWith(SignIn value, $Res Function(SignIn) _then) =
      _$SignInCopyWithImpl;
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
class _$SignInCopyWithImpl<$Res> implements $SignInCopyWith<$Res> {
  _$SignInCopyWithImpl(this._self, this._then);

  final SignIn _self;
  final $Res Function(SignIn) _then;

  /// Create a copy of SignIn
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      fullname: null == fullname
          ? _self.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      numero: null == numero
          ? _self.numero
          : numero // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _self.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _self.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      vehiculeColor: null == vehiculeColor
          ? _self.vehiculeColor
          : vehiculeColor // ignore: cast_nullable_to_non_nullable
              as String,
      vehiculeNumber: null == vehiculeNumber
          ? _self.vehiculeNumber
          : vehiculeNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SignIn implements SignIn {
  _SignIn(
      {required this.fullname,
      required this.numero,
      required this.email,
      required this.password,
      required this.accountType,
      required this.brand,
      required this.vehiculeColor,
      required this.vehiculeNumber});
  factory _SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

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

  /// Create a copy of SignIn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignInCopyWith<_SignIn> get copyWith =>
      __$SignInCopyWithImpl<_SignIn>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SignInToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignIn &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullname, numero, email,
      password, accountType, brand, vehiculeColor, vehiculeNumber);

  @override
  String toString() {
    return 'SignIn(fullname: $fullname, numero: $numero, email: $email, password: $password, accountType: $accountType, brand: $brand, vehiculeColor: $vehiculeColor, vehiculeNumber: $vehiculeNumber)';
  }
}

/// @nodoc
abstract mixin class _$SignInCopyWith<$Res> implements $SignInCopyWith<$Res> {
  factory _$SignInCopyWith(_SignIn value, $Res Function(_SignIn) _then) =
      __$SignInCopyWithImpl;
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
class __$SignInCopyWithImpl<$Res> implements _$SignInCopyWith<$Res> {
  __$SignInCopyWithImpl(this._self, this._then);

  final _SignIn _self;
  final $Res Function(_SignIn) _then;

  /// Create a copy of SignIn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_SignIn(
      fullname: null == fullname
          ? _self.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      numero: null == numero
          ? _self.numero
          : numero // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _self.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _self.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      vehiculeColor: null == vehiculeColor
          ? _self.vehiculeColor
          : vehiculeColor // ignore: cast_nullable_to_non_nullable
              as String,
      vehiculeNumber: null == vehiculeNumber
          ? _self.vehiculeNumber
          : vehiculeNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
