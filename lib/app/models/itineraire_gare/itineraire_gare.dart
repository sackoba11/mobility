import 'package:freezed_annotation/freezed_annotation.dart';

part 'itineraire_gare.freezed.dart';
part 'itineraire_gare.g.dart';

@freezed
abstract class ItineraireGare with _$ItineraireGare {
  factory ItineraireGare(
      {required String source,
      required String destination,
      required String type,
      required String commune}) = _ItineraireGare;
  factory ItineraireGare.fromJson(Map<String, dynamic> json) =>
      _$ItineraireGareFromJson(json);
}
