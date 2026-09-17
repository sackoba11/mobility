import 'package:freezed_annotation/freezed_annotation.dart';

import '../gare_location/gare_location.dart';
import '../transport_type.dart';

part 'gare.freezed.dart';
part 'gare.g.dart';

@freezed
abstract class Gare with _$Gare {
  factory Gare(
      {required String name,
      required String commune,
      @TransportTypeConverter() required TransportType type,
      required GareLocation location}) = _Gare;
  factory Gare.fromJson(Map<String, dynamic> json) => _$GareFromJson(json);
}

extension GareX on Gare {
  /// Ancien accès `gare.type` String pour compat UI.
  String get typeLabel => type.label;
}
