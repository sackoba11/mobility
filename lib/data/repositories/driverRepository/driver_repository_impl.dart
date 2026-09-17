import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:mobility/utils/error/app_error.dart';

import '../../../models/bus/bus_from_firestore/bus.dart';
import 'i_driver_repository.dart';

@LazySingleton(as: IDriverRepository)
class DriverRepositoryImpl implements IDriverRepository {
  // Legacy RTDB (à supprimer quand plus aucun bus actif RTDB).
  DatabaseReference ref = FirebaseDatabase.instance.ref().child("activeBus");

  // Cible simplifiée 100% Firestore (Phase 2b).
  CollectionReference get _activeBusFs =>
      FirebaseFirestore.instance.collection('activeBus');

  String _docId(int busNumber, String idBus) => "${busNumber}_$idBus";

  @override
  Future<Either<AppError, List<Bus>>> getAllBus() async {
    try {
      final snapShotListBus =
          await FirebaseFirestore.instance.collection('listBus').get();
      final docsListBus = snapShotListBus.docs;
      final buslistFirebse =
          docsListBus.map((e) => Bus.fromJson(e.data())).toList();
      return right(buslistFirebse);
    } catch (e) {
      return left(GenericAppError("erreur listBus: ${e.toString()}"));
    }
  }

  @override
  Future<Either<AppError, String>> activateBusService(
      {required Bus bus, required Position position}) async {
    var dbRef = ref.child("${bus.number}");
    var map = bus.roadMap.map((e) => e.toJson()).toList();

    Map activeBus = {
      "number": bus.number,
      "source": bus.source,
      "startDate": DateTime.now().toIso8601String(),
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
      // Firestore (cible) + RTDB (legacy compat).
      await _activeBusFs.doc(_docId(bus.number, dateTime)).set(activeBus);
      try {
        await dbRef.child(dateTime).set(activeBus);
      } catch (_) {}
      return right(dateTime);
    } catch (e) {
      return left(GenericAppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, bool>> deactivateBusService(
      {required int busNumber, required String idBus}) async {
    try {
      await _activeBusFs.doc(_docId(busNumber, idBus)).delete();
      try {
        await ref.child("$busNumber").child(idBus).remove();
      } catch (_) {}
      return right(true);
    } catch (e) {
      return left(GenericAppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, bool>> updatePosition(
      {required int busNumber,
      required String idBus,
      required double lat,
      required double long}) async {
    try {
      await _activeBusFs.doc(_docId(busNumber, idBus)).update({
        "position": {
          "lat": lat,
          "long": long,
        },
      });
      try {
        await ref.child("$busNumber").child(idBus).update({
          "position": {
            "lat": lat,
            "long": long,
          },
        });
      } catch (_) {}
      return right(true);
    } catch (e) {
      return left(GenericAppError(e.toString()));
    }
  }
}
