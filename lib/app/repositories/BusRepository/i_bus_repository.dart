import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../error/app_error.dart';

abstract class IBusRepository {
  Future<Either<AppError, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
      getBusRoadMaps();
  Future<Either<AppError, bool>> addRoadMap();
}
