import 'package:freezed_annotation/freezed_annotation.dart';

/// Type de transport (Gbaka / Taxi / Bus). Stocké en Firestore comme
/// String ("Gbaka", "Taxi"...), tolérant à la casse et aux inconnus.
enum TransportType {
  gbaka,
  taxi,
  bus,
  unknown,
}

extension TransportTypeX on TransportType {
  String get label => switch (this) {
        TransportType.gbaka => "Gbaka",
        TransportType.taxi => "Taxi",
        TransportType.bus => "Bus",
        TransportType.unknown => "Autre",
      };

  static TransportType fromString(String? value) {
    final v = (value ?? "").trim().toLowerCase();
    return switch (v) {
      "gbaka" => TransportType.gbaka,
      "taxi" => TransportType.taxi,
      "bus" || "sotra" => TransportType.bus,
      _ => TransportType.unknown,
    };
  }
}

class TransportTypeConverter implements JsonConverter<TransportType, String> {
  const TransportTypeConverter();

  @override
  TransportType fromJson(String json) => TransportTypeX.fromString(json);

  @override
  String toJson(TransportType object) => object.label;
}
