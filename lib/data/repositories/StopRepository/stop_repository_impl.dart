import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobility/models/transit_stop/transit_stop.dart';
import 'package:mobility/utils/error/app_error.dart';

import 'i_stop_repository.dart';

@LazySingleton(as: IStopRepository)
class StopRepositoryImpl implements IStopRepository {
  @override
  Future<Either<AppError, List<TransitStop>>> getAllStops() async {
    try {
      final snap =
          await FirebaseFirestore.instance.collection('stops').get();
      final stops = <TransitStop>[];
      for (final doc in snap.docs) {
        try {
          stops.add(TransitStop.fromJson(doc.data()));
        } catch (_) {
          // Doc incomplet : ignoré plutôt que de casser la liste.
        }
      }
      return right(stops);
    } catch (e) {
      return left(GenericAppError("erreur stops: ${e.toString()}"));
    }
  }
}
