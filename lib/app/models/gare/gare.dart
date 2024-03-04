import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobility/app/models/stop/stop.dart';

part 'gare.freezed.dart';
part 'gare.g.dart';

@freezed
abstract class Gare with _$Gare {
  factory Gare(
      {required String name,
      required String commune,
      required String type,
      required Stop location}) = _Gare;
  factory Gare.fromJson(Map<String, dynamic> json) => _$GareFromJson(json);
}
