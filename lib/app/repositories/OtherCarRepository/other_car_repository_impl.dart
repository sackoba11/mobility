import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobility/app/error/app_error.dart';
import 'package:mobility/app/mockData/mock_data.dart';
import 'package:mobility/app/models/gare/gare.dart';

import 'i_other_car_repository.dart';

@LazySingleton(as: IOtherCarRepository)
class OtherCarRepositoryImpl implements IOtherCarRepository {
  @override
  Future<Either<AppError, List<Gare>>> getAllGares() async {
    try {
      final snapShotListGares =
          await FirebaseFirestore.instance.collection('GaresGbaka').get();
      final docsListGares = snapShotListGares.docs;
      final buslistFirebse =
          docsListGares.map((e) => Gare.fromJson(e.data())).toList();
      return right(buslistFirebse);
    } catch (e) {
      return left(GenericAppError("erreur: ${e.toString()}"));
    }
  }

  @override
  Future<Either<AppError, bool>> addAllGares() async {
    List<Gare> garesGbaka = MockData.garesGbaka;
    // List<Gare> garestaxi = MockData.garesTaxi;
    try {
      for (var element in garesGbaka) {
        print(element.toJson());
        await FirebaseFirestore.instance
            .collection("GaresGbaka")
            .add(element.toJson());
      }
      // for (var element in garestaxi) {
      //   await FirebaseFirestore.instance
      //       .collection("GaresTaxi")
      //       .add(element.toJson());
      // }
      return right(true);
    } catch (e) {
      return left(GenericAppError("erreur : ${e.toString()}"));
    }
  }
}
