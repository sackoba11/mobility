import 'package:dartz/dartz.dart';
import 'package:mobility/app/models/bus/bus.dart';

import '../../error/app_error.dart';

abstract class IDriverRepository {
  Future<Either<AppError, bool>> activateBusService(Bus bus);
}
