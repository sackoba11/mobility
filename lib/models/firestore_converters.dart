import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Convertit les dates Firestore (Timestamp natif, String ISO, int ms)
/// vers DateTime. Indispensable pour les champs écrits via
/// `FieldValue.serverTimestamp()` (lus comme Timestamp).
class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.tryParse(json);
    if (json is int) {
      return DateTime.fromMillisecondsSinceEpoch(json);
    }
    return null;
  }

  @override
  Object? toJson(DateTime? date) => date?.toIso8601String();
}
