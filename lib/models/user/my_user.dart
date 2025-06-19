import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_user.freezed.dart';
part 'my_user.g.dart';

@freezed
abstract class MyUser with _$MyUser {
  factory MyUser(
      {required String uid,
      required String name,
      required String email,
      required bool isDriver}) = _MyUser;
  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);
}
