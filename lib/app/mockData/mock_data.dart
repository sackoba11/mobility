import 'package:mobility/app/models/bus/bus.dart';
import 'package:mobility/app/models/road/road_map.dart';
import 'package:mobility/app/models/stop/stop.dart';

class MockData {
  static List<Stop> stop = <Stop>[
    Stop(
      lat: 5.3502292,
      long: -3.9881887,
    ),
    Stop(
      lat: 5.350667,
      long: -3.988207,
    ),
    Stop(
      lat: 5.351888,
      long: -3.983774,
    ),
    Stop(
      lat: 5.353108,
      long: -3.979858,
    ),
    Stop(
      lat: 5.353845,
      long: -3.977656,
    ),
    Stop(
      lat: 5.354784,
      long: -3.974198,
    ),
    Stop(
      lat: 5.356915,
      long: -3.967548,
    ),
    Stop(
      lat: 5.358065,
      long: -3.964597,
    ),
    Stop(
      lat: 5.360552,
      long: -3.965393,
    ),
    Stop(
      lat: 5.362438,
      long: -3.966146,
    ),
    Stop(
      lat: 5.362040,
      long: -3.967070,
    ),
  ];

  static var roadList = <RoadMap>[
    // RoadMap(roadMap: stop),
    // RoadMap(roadMap: stop),
    // RoadMap(roadMap: stop),
    // RoadMap(roadMap: stop),
    // RoadMap(roadMap: stop),
  ];

  static var busLists = [
    Bus(
        number: 610,
        source: "Adjamé",
        destination: "BingerVille",
        roadMap: roadList[0],
        isActive: true),
    Bus(
        number: 610,
        source: "Ecole de Police",
        destination: "Chu TreichVille",
        roadMap: roadList[0],
        isActive: false),
    Bus(
        number: 21,
        source: "Abobo Sogefia",
        destination: "Gare Sud",
        roadMap: roadList[1],
        isActive: true),
    Bus(
        number: 21,
        source: "Gare Campus",
        destination: "Yopougon Kouté",
        roadMap: roadList[1],
        isActive: false),
    Bus(
        number: 15,
        source: "Abobo Sogefia",
        destination: "Gare Campus",
        roadMap: roadList[2],
        isActive: true),
    Bus(
        number: 15,
        source: "Abobo Sogefia",
        destination: "Gare Campus",
        roadMap: roadList[2],
        isActive: false),
    // Bus(numberBus: 728, roadMap: roadList[3], isActive: true),
    // Bus(numberBus: 728, roadMap: roadList[3], isActive: false),
    // Bus(numberBus: 49, roadMap: roadList[4], isActive: true),
    // Bus(numberBus: 49, roadMap: roadList[4], isActive: false),
  ];
}
