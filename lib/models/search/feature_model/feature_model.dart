import 'package:freezed_annotation/freezed_annotation.dart';

import '../feature_context/feature_context.dart';
import '../feature_geometry/feature_geometry.dart';
import '../feature_properties/feature_properties.dart';

part 'feature_model.freezed.dart';
part 'feature_model.g.dart';

@freezed
abstract class FeatureModel with _$FeatureModel {
  factory FeatureModel({
    required String id,
    required String type,
    required List<String> placeType,
    required double relevance,
    required FeatureProperties properties,
    required String text,
    required String placeName,
    required List<double> center,
    required FeatureGeometry geometry,
    required List<FeatureContext> context,
  }) = _FeatureModel;
  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);
}
