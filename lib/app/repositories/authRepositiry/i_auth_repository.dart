import 'package:dartz/dartz.dart';
import 'package:mobility/app/error/app_error.dart';

abstract class IAuthRepository {
  Future<Either<AppError, bool>> signIn();
}
