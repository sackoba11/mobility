import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobility/utils/error/app_error.dart';
import 'package:mobility/models/user/my_user.dart';

abstract class IAuthRepository {
  Future<Either<AppError, UserCredential>> signInWithEmailAndPassword({
    required String userName,
    required String userNumber,
    required String typeOfCar,
    required String brand,
    required String color,
    required String userEmail,
    required String userPassword,
    bool isLinkWithCredentials = false,
  });
  Future<Either<AppError, bool>> resetpassword(String email);
  Future<void> signOut();
  Future<void> signOutFromGoogle();
  Future<Either<AppError, MyUser>> getUser(String uid);
  Future<Either<AppError, User>> getCurrentUser();
  Future<Either<AppError, bool>> addDriverInfos(
      {required String uid, required Map<String, dynamic> map});

  Future<Either<AppError, UserCredential>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<AppError, UserCredential>> signInWithGoogle(
      {bool reauth = false});
  // Future<Either<AppError, Unit>> signInWithFacebook();
}
