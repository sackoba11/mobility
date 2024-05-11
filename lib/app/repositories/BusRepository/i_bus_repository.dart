import 'package:dartz/dartz.dart';

import '../../error/app_error.dart';
import '../../models/bus/bus_from_db.dart';

abstract class IBusRepository {
  Future<Either<AppError, List<BusFromDb>>> getBusRoadMaps();
  Future<Either<AppError, bool>> addRoadMap();
}
