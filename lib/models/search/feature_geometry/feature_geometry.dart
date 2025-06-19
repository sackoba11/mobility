import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_geometry.freezed.dart';
part 'feature_geometry.g.dart';

@freezed
abstract class FeatureGeometry with _$FeatureGeometry {
  factory FeatureGeometry(
      {required String type,
      required List<double> coordinates}) = _FeatureGeometry;
  factory FeatureGeometry.fromJson(Map<String, dynamic> json) =>
      _$FeatureGeometryFromJson(json);
}
