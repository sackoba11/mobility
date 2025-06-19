import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in.freezed.dart';
part 'sign_in.g.dart';

@freezed
abstract class SignIn with _$SignIn {
  factory SignIn(
      {required String fullname,
      required String numero,
      required String email,
      required String password,
      required String accountType,
      required String brand,
      required String vehiculeColor,
      required String vehiculeNumber}) = _SignIn;
  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);
}
