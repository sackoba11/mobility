import 'package:dartz/dartz.dart';
import 'package:mobility/app/error/app_error.dart';

abstract class IAuthRepository {
  Future<Either<AppError, Unit>> signInWithGoogle();
  Future<Either<AppError, Unit>> signInWithEmailAndPassword({
    required String usereEmail,
    required String userPassword,
    bool isLinkWithCredentials = false,
  });
  // Future<Either<AppError, Unit>> signInWithFacebook();
}
