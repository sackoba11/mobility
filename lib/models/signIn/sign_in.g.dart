// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignIn _$SignInFromJson(Map<String, dynamic> json) => _SignIn(
      fullname: json['fullname'] as String,
      numero: json['numero'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      accountType: json['accountType'] as String,
      brand: json['brand'] as String,
      vehiculeColor: json['vehiculeColor'] as String,
      vehiculeNumber: json['vehiculeNumber'] as String,
    );

Map<String, dynamic> _$SignInToJson(_SignIn instance) => <String, dynamic>{
      'fullname': instance.fullname,
      'numero': instance.numero,
      'email': instance.email,
      'password': instance.password,
      'accountType': instance.accountType,
      'brand': instance.brand,
      'vehiculeColor': instance.vehiculeColor,
      'vehiculeNumber': instance.vehiculeNumber,
    };
