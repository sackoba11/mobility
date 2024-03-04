import 'package:dartz/dartz.dart';
import 'package:mobility/app/models/gare/gare.dart';

import '../../error/app_error.dart';

abstract class IOtherCarRepository {
  Future<Either<AppError, List<Gare>>> getAllGares();
}
