import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobility/app/models/bus/bus.dart';

import '../../error/app_error.dart';

abstract class IDriverRepository {
  Future<Either<AppError, List<Bus>>> getBusRoadMaps();
  Future<Either<AppError, String>> activateBusService(
      {required Bus bus, required Position position});
  Future<Either<AppError, void>> updatePosition(
      {required int busNumber,
      required String idBus,
      required double lat,
      required double long});
  Future<Either<AppError, bool>> deactivateBusService(
      {required int busNumber, required String idBus});
}
