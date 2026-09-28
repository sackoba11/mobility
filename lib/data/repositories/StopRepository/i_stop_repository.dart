import 'package:dartz/dartz.dart';
import 'package:mobility/models/transit_stop/transit_stop.dart';
import 'package:mobility/utils/error/app_error.dart';

abstract class IStopRepository {
  Future<Either<AppError, List<TransitStop>>> getAllStops();
}
