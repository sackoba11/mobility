import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobility/utils/error/app_error.dart';
import 'package:mobility/models/gare/gare.dart';
import 'package:mobility/models/gare_location/gare_location.dart';
import 'package:mobility/models/itineraire_gare/itineraire_gare.dart';
import 'package:mobility/models/transport_type.dart';

import 'i_other_car_repository.dart';

/// Référentiel Gbaka/Taxi : collection unique `station`
/// (scripts/import-stations, 1 doc par trajet).
/// Les gares sont déduites des départs/arrivées (dédupliquées) ;
/// les trajets deviennent des ItineraireGare. Positions nulles tant
/// que le lieu n'est pas géocodé (l'app les gère gracieusement).
@LazySingleton(as: IOtherCarRepository)
class OtherCarRepositoryImpl implements IOtherCarRepository {
  GareLocation? _loc(Object? raw) {
    if (raw is! Map) return null;
    final lat = raw['lat'];
    final lng = raw['lng'];
    if (lat is! num || lng is! num) return null;
    return GareLocation(
      lat: lat.toDouble(),
      long: lng.toDouble(),
      label: raw['label']?.toString(),
    );
  }

  Gare _gare(
      String name, String commune, TransportType type, Object? loc) {
    return Gare(
      name: name,
      commune: commune,
      type: type,
      location: _loc(loc),
    );
  }

  TransportType _typeOf(Object? raw) =>
      TransportTypeX.fromString(raw?.toString());

  @override
  Future<Either<AppError, List<Gare>>> getAllGares() async {
    try {
      final snap =
          await FirebaseFirestore.instance.collection('station').get();
      // Déduplique les lieux (départs + arrivées) par type/commune/nom.
      final seen = <String>{};
      final gares = <Gare>[];

      for (final doc in snap.docs) {
        final data = doc.data();
        final commune = (data['commune'] ?? '').toString();
        final type = _typeOf(data['type']);
        final dep = (data['departure'] ?? '').toString().trim();
        final arr = (data['arrival'] ?? '').toString().trim();
        if (dep.isNotEmpty) {
          _addGare(
              dep, commune, type, data['departureLocation'], seen, gares);
        }
        if (arr.isNotEmpty) {
          _addGare(
              arr, commune, type, data['arrivalLocation'], seen, gares);
        }
      }
      gares.sort((a, b) => a.name.compareTo(b.name));
      return right(gares);
    } catch (e) {
      return left(GenericAppError("erreur station: ${e.toString()}"));
    }
  }

  void _addGare(String name, String commune, TransportType type,
      Object? loc, Set<String> seen, List<Gare> gares) {
    final key =
        '${type.name}|${commune.toLowerCase()}|${name.toLowerCase()}';
    if (!seen.add(key)) return;
    gares.add(_gare(name, commune, type, loc));
  }

  @override
  Future<Either<AppError, List<ItineraireGare>>> getAllItinerary() async {
    try {
      final snap =
          await FirebaseFirestore.instance.collection('station').get();
      final itineraries = <ItineraireGare>[];
      for (final doc in snap.docs) {
        final data = doc.data();
        final commune = (data['commune'] ?? '').toString();
        final type = _typeOf(data['type']);
        final dep = (data['departure'] ?? '').toString().trim();
        final arr = (data['arrival'] ?? '').toString().trim();
        if (dep.isEmpty || arr.isEmpty) continue;
        itineraries.add(ItineraireGare(
          source: _gare(dep, commune, type, data['departureLocation']),
          destination:
              _gare(arr, commune, type, data['arrivalLocation']),
          type: type,
          commune: commune,
        ));
      }
      return right(itineraries);
    } catch (e) {
      return left(GenericAppError("erreur station: ${e.toString()}"));
    }
  }
}
