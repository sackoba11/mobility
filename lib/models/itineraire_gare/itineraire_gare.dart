import 'package:freezed_annotation/freezed_annotation.dart';

import '../gare/gare.dart';
import '../transport_type.dart';

part 'itineraire_gare.freezed.dart';
part 'itineraire_gare.g.dart';

@freezed
abstract class ItineraireGare with _$ItineraireGare {
  factory ItineraireGare(
      {required Gare source,
      required Gare destination,
      @TransportTypeConverter() required TransportType type,
      required String commune}) = _ItineraireGare;
  factory ItineraireGare.fromJson(Map<String, dynamic> json) =>
      _$ItineraireGareFromJson(json);
}
