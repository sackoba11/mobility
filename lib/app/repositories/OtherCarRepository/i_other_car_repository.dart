import 'package:dartz/dartz.dart';
import 'package:mobility/app/models/gare/gare.dart';
import 'package:mobility/app/models/itineraire_gare/itineraire_gare.dart';

import '../../error/app_error.dart';

abstract class IOtherCarRepository {
  Future<Either<AppError, List<Gare>>> getAllGares();
  Future<Either<AppError, List<ItineraireGare>>> getAllItinerary();
  Future<Either<AppError, bool>> addAllGares();
}
