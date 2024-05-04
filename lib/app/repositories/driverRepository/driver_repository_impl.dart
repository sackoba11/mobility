import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:mobility/app/error/app_error.dart';
import 'package:mobility/app/models/bus/bus.dart';

import 'i_driver_repository.dart';

@LazySingleton(as: IDriverRepository)
class DriverRepositoryImpl implements IDriverRepository {
  @override
  Future<Either<AppError, bool>> activateBusService(Bus bus) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref()
        .child("activeBus")
        .child("${bus.number}");
    var map = bus.roadMap.map((e) => e.toJson()).toList();
    Map activeBus = {
      "number": bus.number,
      "source": bus.source,
      "startDate": DateTime.now().toString(),
      "destination": bus.destination,
      "isActive": true,
      "roadMap": map
    };
    var dateTime = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      ref.child(dateTime).set(activeBus);
      return right(true);
    } catch (e) {
      return left(GenericAppError("$e"));
    }
  }
}
