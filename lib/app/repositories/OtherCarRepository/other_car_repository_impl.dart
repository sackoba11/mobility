import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobility/app/error/app_error.dart';
import 'package:mobility/app/models/gare/gare.dart';

import 'i_other_car_repository.dart';

@LazySingleton(as: IOtherCarRepository)
class OtherCarRepositoryImpl implements IOtherCarRepository {
  @override
  Future<Either<AppError, List<Gare>>> getAllGares() {
    // TODO: implement getAllGares
    throw UnimplementedError();
  }
}
