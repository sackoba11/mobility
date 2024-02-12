import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobility/app/error/app_error.dart';

abstract class IAuthRepository {
  Future<Either<AppError, UserCredential>> signInWithGoogle();
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
  // Future<Either<AppError, Unit>> signInWithFacebook();
}
