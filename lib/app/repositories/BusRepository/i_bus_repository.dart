import 'package:dartz/dartz.dart';

import '../../error/app_error.dart';
import '../../models/bus/bus.dart';

abstract class IBusRepository {
  Future<Either<AppError, List<Bus>>> getBusRoadMaps();
  Future<Either<AppError, bool>> addRoadMap();
}
