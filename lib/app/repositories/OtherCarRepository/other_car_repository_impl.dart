import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
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
    List<Gare> garesGbaka = MockData.garesGbaka;
    List<Gare> garestaxi = MockData.garesTaxi;
    List<ItineraireGare> itineraires = MockData.itinraire;
    try {
      for (var element in garesGbaka) {
        await FirebaseFirestore.instance
            .collection("GaresGbaka")
            .add(element.toJson());
      }
      for (var element in garestaxi) {
        await FirebaseFirestore.instance
            .collection("GaresTaxi")
            .add(element.toJson());
      }
      for (var element in itineraires) {
        await FirebaseFirestore.instance
            .collection("Itineraires")
            .add(element.toJson());
      }
      return right(true);
    } catch (e) {
      return left(GenericAppError("erreur : ${e.toString()}"));
    }
  }

  @override
  Future<Either<AppError, List<ItineraireGare>>> getAllItinerary() async {
    try {
      final snapShotList =
          await FirebaseFirestore.instance.collection('Itineraires').get();

      final docListItinerary = snapShotList.docs;
      final listItinerary = docListItinerary
          .map((e) => ItineraireGare.fromJson(e.data()))
          .toList();
      debugPrint(
          "teste de itineraire : ${snapShotList.docs..map((e) => ItineraireGare.fromJson(e.data())).toString()}");
      return right(listItinerary);
    } catch (e) {
      return left(GenericAppError("erreur: ${e.toString()}"));
    }
  }
}
