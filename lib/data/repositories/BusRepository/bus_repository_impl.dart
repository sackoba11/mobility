import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/error/app_error.dart';
import '../../../models/bus/bus_from_realTime/bus_from_db.dart';
import 'i_bus_repository.dart';

@LazySingleton(as: IBusRepository)
class BusRepositoryImpl implements IBusRepository {
  // Le référentiel vient de Firestore `listBus`, le live de Firestore
  // `activeBus` (RTDB conservée en fallback legacy, à supprimer ensuite).

  /// Live : Firestore d'abord, RTDB en fallback.
  @override
  Future<Either<AppError, List<BusFromDb>>> getActiveBus() async {
    try {
      final fsSnap = await FirebaseFirestore.instance
          .collection('activeBus')
          .where('isActive', isEqualTo: true)
          .get();
      if (fsSnap.docs.isNotEmpty) {
        final buses = fsSnap.docs
            .map((e) => BusFromDb.fromJson(e.data()))
            .toList();
        return right(buses);
      }
    } catch (_) {
      // Fallback RTDB ci-dessous.
    }
    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref().child("activeBus");

      List<BusFromDb> dataBus = [];
      final activeListBus = await ref.get();
      for (final busGroup in activeListBus.children) {
        for (final e in busGroup.children) {
          dataBus.add(BusFromDb.fromJson(jsonDecode(jsonEncode(e.value))));
        }
      }

      return right(dataBus);
    } catch (e) {
      return left(GenericAppError("erreur activeBus: ${e.toString()}"));
    }
  }

  @override
  Future<Either<AppError, List<BusFromDb>>> getAllBus() async {
    try {
      final snapShotListBus =
          await FirebaseFirestore.instance.collection('listBus').get();
      final docsListBus = snapShotListBus.docs;
      final buslistFirebse =
          docsListBus.map((e) => BusFromDb.fromJson(e.data())).toList();
      return right(buslistFirebse);
    } catch (e) {
      return left(GenericAppError("erreur listBus: ${e.toString()}"));
    }
  }
}
