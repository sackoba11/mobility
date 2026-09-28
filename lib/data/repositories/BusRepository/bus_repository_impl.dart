import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/error/app_error.dart';
import '../../../models/bus/bus_from_realTime/bus_from_db.dart';
import 'i_bus_repository.dart';

@LazySingleton(as: IBusRepository)
class BusRepositoryImpl implements IBusRepository {
  // Source unique : Firestore. `bus` = référentiel statique
  // (scripts/import-bus, 1 doc par variante aller/retour),
  // `activeBus` = bus en service (temps réel via snapshots).
  CollectionReference get _activeBusFs =>
      FirebaseFirestore.instance.collection('activeBus');

  List<BusFromDb> _fromSnapshot(QuerySnapshot snap) {
    return snap.docs
        .map((e) => BusFromDb.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }

  /// Lecture unique (pull-to-refresh, chargement initial).
  @override
  Future<Either<AppError, List<BusFromDb>>> getActiveBus() async {
    try {
      final fsSnap =
          await _activeBusFs.where('isActive', isEqualTo: true).get();
      return right(_fromSnapshot(fsSnap));
    } catch (e) {
      return left(GenericAppError("erreur activeBus: ${e.toString()}"));
    }
  }

  /// Temps réel : notifie à chaque mise à jour de position des chauffeurs
  /// (remplace l'ancien usage de RTDB).
  @override
  Stream<List<BusFromDb>> watchActiveBus() {
    return _activeBusFs
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map(_fromSnapshot);
  }

  @override
  Future<Either<AppError, List<BusFromDb>>> getAllBus() async {
    try {
      final snapShotBus =
          await FirebaseFirestore.instance.collection('bus').get();
      final docsBus = snapShotBus.docs;
      final buslistFirebse =
          docsBus.map((e) => BusFromDb.fromJson(e.data())).toList();
      return right(buslistFirebse);
    } catch (e) {
      return left(GenericAppError("erreur bus: ${e.toString()}"));
    }
  }
}
