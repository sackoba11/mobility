// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyUser _$MyUserFromJson(Map<String, dynamic> json) => _MyUser(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      isDriver: json['isDriver'] as bool,
    );

Map<String, dynamic> _$MyUserToJson(_MyUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'isDriver': instance.isDriver,
    };
