import 'package:freezed_annotation/freezed_annotation.dart';

part 'gare_location.freezed.dart';
part 'gare_location.g.dart';

/// Position d'une gare. `label` optionnel (ancien seed "teste").
@freezed
abstract class GareLocation with _$GareLocation {
  factory GareLocation({
    String? label,
    required double lat,
    required double long,
  }) = _GareLocation;
  factory GareLocation.fromJson(Map<String, dynamic> json) =>
      _$GareLocationFromJson(json);
}
