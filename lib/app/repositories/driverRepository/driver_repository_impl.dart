import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:mobility/app/error/app_error.dart';
import 'package:mobility/app/models/bus/bus.dart';

import 'i_driver_repository.dart';

@LazySingleton(as: IDriverRepository)
class DriverRepositoryImpl implements IDriverRepository {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child("activeBus");

  @override
  Future<Either<AppError, List<Bus>>> getBusRoadMaps() async {
    final snapShotListBus =
        await FirebaseFirestore.instance.collection('listBus').get();
    // print(snapShotListBus);
    final docsListBus = snapShotListBus.docs;
    // print(docsListBus);
    final buslistFirebse =
        docsListBus.map((e) => Bus.fromJson(e.data())).toList();
    print(buslistFirebse.first);
    return right(buslistFirebse);
  }

  @override
  Future<Either<AppError, String>> activateBusService(
      {required Bus bus, required Position position}) async {
    var dbRef = ref.child("${bus.number}");
    var map = bus.roadMap.map((e) => e.toJson()).toList();

    Map activeBus = {
      "number": bus.number,
      "source": bus.source,
      "startDate": DateTime.now().toString(),
      "destination": bus.destination,
      "isActive": true,
      "position": {
        "lat": position.latitude,
        "long": position.longitude,
      },
      "roadMap": map
    };
    var dateTime = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      dbRef.child(dateTime).set(activeBus);
      return right(dateTime);
    } catch (e) {
      return left(GenericAppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, bool>> deactivateBusService(
      {required int busNumber, required String idBus}) async {
    var dBRefRemove = ref.child("$busNumber").child(idBus);
    try {
      dBRefRemove.remove();
      return right(true);
    } catch (e) {
      return left(GenericAppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> updatePosition(
      {required int busNumber,
      required String idBus,
      required double lat,
      required double long}) async {
    var dBRefUpdate = ref.child("$busNumber").child(idBus);
    try {
      dBRefUpdate.update({
        "position": {
          "lat": lat,
          "long": long,
        },
      });
      return right(true);
    } catch (e) {
      return left(GenericAppError(e.toString()));
    }
  }
}
