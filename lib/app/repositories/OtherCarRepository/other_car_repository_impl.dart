import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobility/app/error/app_error.dart';
import 'package:mobility/app/mockData/mock_data.dart';
import 'package:mobility/app/models/gare/gare.dart';
import 'package:mobility/app/models/itineraire_gare/itineraire_gare.dart';

import 'i_other_car_repository.dart';

@LazySingleton(as: IOtherCarRepository)
class OtherCarRepositoryImpl implements IOtherCarRepository {
  @override
  Future<Either<AppError, List<Gare>>> getAllGares() async {
    try {
      final snapShotListGaresGbaka =
          await FirebaseFirestore.instance.collection('GaresGbaka').get();
      final docsListGaresGbaka = snapShotListGaresGbaka.docs;
      final buslistFirebaseGbaka =
          docsListGaresGbaka.map((e) => Gare.fromJson(e.data())).toList();
      final snapShotListGaresTaxi =
          await FirebaseFirestore.instance.collection('GaresTaxi').get();
      final docsListGaresTaxi = snapShotListGaresTaxi.docs;
      final buslistFirebaseTaxi =
          docsListGaresTaxi.map((e) => Gare.fromJson(e.data())).toList();
      final buslistFirebase = buslistFirebaseGbaka + buslistFirebaseTaxi;
      return right(buslistFirebase);
    } catch (e) {
      return left(GenericAppError("erreur: ${e.toString()}"));
    }
  }

  @override
  Future<Either<AppError, bool>> addAllGares() async {
    List<Gare> garesGbaka = MockData.garesGbaka + MockData.garesTaxi;
    // List<Gare> garestaxi = MockData.garesTaxi;
    List<ItineraireGare> itineraireGbaka = MockData.itineraireGbaka;
    List<ItineraireGare> itineraireTaxi = MockData.itineraireTaxi;
    try {
      for (var element in garesGbaka) {
        await FirebaseFirestore.instance
            .collection("Gares")
            .add(element.toJson());
      }
      // for (var element in garestaxi) {
      //   await FirebaseFirestore.instance
      //       .collection("GaresTaxi")
      //       .add(element.toJson());
      // }
      // for (var element in itineraireGbaka) {
      //   await FirebaseFirestore.instance
      //       .collection("ItinerairesGbaka")
      //       .add(element.toJson());
      // }
      // for (var element in itineraireTaxi) {
      //   await FirebaseFirestore.instance
      //       .collection("ItinerairesTaxi")
      //       .add(element.toJson());
      // }
      return right(true);
    } catch (e) {
      return left(GenericAppError("erreur : ${e.toString()}"));
    }
  }

  @override
  Future<Either<AppError, List<ItineraireGare>>> getAllItinerary() async {
    try {
      final snapShotListGbaka =
          await FirebaseFirestore.instance.collection('ItinerairesGbaka').get();

      final docListItineraryGbaka = snapShotListGbaka.docs;
      final listItineraryGbaka = docListItineraryGbaka
          .map((e) => ItineraireGare.fromJson(e.data()))
          .toList();
      final snapShotListTaxi =
          await FirebaseFirestore.instance.collection('ItinerairesTaxi').get();

      final docListItineraryTaxi = snapShotListTaxi.docs;
      final listItineraryTaxi = docListItineraryTaxi
          .map((e) => ItineraireGare.fromJson(e.data()))
          .toList();

      final listItineraires = listItineraryGbaka + listItineraryTaxi;
      return right(listItineraires);
    } catch (e) {
      return left(GenericAppError("erreur: ${e.toString()}"));
    }
  }
}
