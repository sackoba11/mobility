import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../utils/error/app_error.dart';
import '../../../models/bus/bus_from_firestore/bus.dart';

abstract class IDriverRepository {
  Future<Either<AppError, List<Bus>>> getAllBus();
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
