import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../error/app_error.dart';
import '../../models/bus/bus.dart';
import 'i_bus_repository.dart';

@LazySingleton(as: IBusRepository)
class BusRepositoryImpl implements IBusRepository {
  // var buslistFirebse = <Bus>[].obs;

  List<Map<String, dynamic>> dataBus = [
    {
      "number": 610,
      "source": "Adjamé",
      "destination": "BingerVille",
      "isActive": true,
      "roadMap": {
        {"lat": 5.3502292, "long": -3.9881887},
        {"lat": 5.350667, "long": -3.988207},
        {"lat": 5.351888, "long": -3.983774},
        {"lat": 5.353108, "long": -3.979858},
        {"lat": 5.353845, "long": -3.977656},
        {"lat": 5.354784, "long": -3.974198},
        {"lat": 5.356915, "long": -3.967548},
        {"lat": 5.358065, "long": -3.964597},
        {"lat": 5.360552, "long": -3.965393},
        {"lat": 5.362438, "long": -3.966146},
      }
    },
    {
      "number": 610,
      "source": "Adjamé",
      "destination": "BingerVille",
      "isActive": false,
      "roadMap": {
        {"lat": 5.3502292, "long": -3.9881887},
        {"lat": 5.350667, "long": -3.988207},
        {"lat": 5.351888, "long": -3.983774},
        {"lat": 5.353108, "long": -3.979858},
        {"lat": 5.353845, "long": -3.977656},
        {"lat": 5.354784, "long": -3.974198},
        {"lat": 5.356915, "long": -3.967548},
        {"lat": 5.358065, "long": -3.964597},
        {"lat": 5.360552, "long": -3.965393},
        {"lat": 5.362438, "long": -3.966146},
      }
    },
    {
      "number": 21,
      "source": "Ecole de Police",
      "destination": "Chu TreichVille",
      "isActive": true,
      "roadMap": {
        {"lat": 5.3502292, "long": -3.9881887},
        {"lat": 5.350667, "long": -3.988207},
        {"lat": 5.351888, "long": -3.983774},
        {"lat": 5.353108, "long": -3.979858},
        {"lat": 5.353845, "long": -3.977656},
        {"lat": 5.354784, "long": -3.974198},
        {"lat": 5.356915, "long": -3.967548},
        {"lat": 5.358065, "long": -3.964597},
        {"lat": 5.360552, "long": -3.965393},
        {"lat": 5.362438, "long": -3.966146},
      }
    },
    {
      "number": 21,
      "source": "Ecole de Police",
      "destination": "Chu TreichVille",
      "isActive": false,
      "roadMap": {
        {"lat": 5.3502292, "long": -3.9881887},
        {"lat": 5.350667, "long": -3.988207},
        {"lat": 5.351888, "long": -3.983774},
        {"lat": 5.353108, "long": -3.979858},
        {"lat": 5.353845, "long": -3.977656},
        {"lat": 5.354784, "long": -3.974198},
        {"lat": 5.356915, "long": -3.967548},
        {"lat": 5.358065, "long": -3.964597},
        {"lat": 5.360552, "long": -3.965393},
        {"lat": 5.362438, "long": -3.966146},
      }
    },
    {
      "number": 15,
      "source": "Abobo Sogefia",
      "destination": "Gare Sud",
      "isActive": true,
      "roadMap": [
        {"lat": 5.3502292, "long": -3.9881887},
        {"lat": 5.350667, "long": -3.988207},
        {"lat": 5.351888, "long": -3.983774},
        {"lat": 5.353108, "long": -3.979858},
        {"lat": 5.353845, "long": -3.977656},
        {"lat": 5.354784, "long": -3.974198},
        {"lat": 5.356915, "long": -3.967548},
        {"lat": 5.358065, "long": -3.964597},
        {"lat": 5.360552, "long": -3.965393},
        {"lat": 5.362438, "long": -3.966146},
      ]
    },
    {
      "number": 15,
      "source": "Abobo Sogefia",
      "destination": "Gare Sud",
      "isActive": false,
      "roadMap": [
        {"lat": 5.3502292, "long": -3.9881887},
        {"lat": 5.350667, "long": -3.988207},
        {"lat": 5.351888, "long": -3.983774},
        {"lat": 5.353108, "long": -3.979858},
        {"lat": 5.353845, "long": -3.977656},
        {"lat": 5.354784, "long": -3.974198},
        {"lat": 5.356915, "long": -3.967548},
        {"lat": 5.358065, "long": -3.964597},
        {"lat": 5.360552, "long": -3.965393},
        {"lat": 5.362438, "long": -3.966146},
      ]
    },
    {
      "number": 85,
      "source": "Gare Campus",
      "destination": "Yopougon Kouté",
      "isActive": true,
      "roadMap": [
        {"lat": 5.3502292, "long": -3.9881887},
        {"lat": 5.350667, "long": -3.988207},
        {"lat": 5.351888, "long": -3.983774},
        {"lat": 5.353108, "long": -3.979858},
        {"lat": 5.353845, "long": -3.977656},
        {"lat": 5.354784, "long": -3.974198},
        {"lat": 5.356915, "long": -3.967548},
        {"lat": 5.358065, "long": -3.964597},
        {"lat": 5.360552, "long": -3.965393},
        {"lat": 5.362438, "long": -3.966146},
      ]
    },
    {
      "number": 85,
      "source": "Gare Campus",
      "destination": "Yopougon Kouté",
      "isActive": false,
      "roadMap": [
        {"lat": 5.3502292, "long": -3.9881887},
        {"lat": 5.350667, "long": -3.988207},
        {"lat": 5.351888, "long": -3.983774},
        {"lat": 5.353108, "long": -3.979858},
        {"lat": 5.353845, "long": -3.977656},
        {"lat": 5.354784, "long": -3.974198},
        {"lat": 5.356915, "long": -3.967548},
        {"lat": 5.358065, "long": -3.964597},
        {"lat": 5.360552, "long": -3.965393},
        {"lat": 5.362438, "long": -3.966146},
      ]
    },
    {
      "number": 49,
      "source": "Abobo Sogefia",
      "destination": "Gare Campus",
      "isActive": true,
      "roadMap": [
        {"lat": 5.3502292, "long": -3.9881887},
        {"lat": 5.350667, "long": -3.988207},
        {"lat": 5.351888, "long": -3.983774},
        {"lat": 5.353108, "long": -3.979858},
        {"lat": 5.353845, "long": -3.977656},
        {"lat": 5.354784, "long": -3.974198},
        {"lat": 5.356915, "long": -3.967548},
        {"lat": 5.358065, "long": -3.964597},
        {"lat": 5.360552, "long": -3.965393},
        {"lat": 5.362438, "long": -3.966146},
      ]
    },
    {
      "number": 49,
      "source": "Abobo Sogefia",
      "destination": "Gare Campus",
      "isActive": false,
      "roadMap": [
        {"lat": 5.3502292, "long": -3.9881887},
        {"lat": 5.350667, "long": -3.988207},
        {"lat": 5.351888, "long": -3.983774},
        {"lat": 5.353108, "long": -3.979858},
        {"lat": 5.353845, "long": -3.977656},
        {"lat": 5.354784, "long": -3.974198},
        {"lat": 5.356915, "long": -3.967548},
        {"lat": 5.358065, "long": -3.964597},
        {"lat": 5.360552, "long": -3.965393},
        {"lat": 5.362438, "long": -3.966146},
      ]
    }
  ];

  @override
  Future<Either<AppError, bool>> addRoadMap() async {
    for (var element in dataBus) {
      await FirebaseFirestore.instance.collection("listBus").add(element);
    }
    return right(true);
  }

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
}
