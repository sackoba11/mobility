import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_properties.freezed.dart';
part 'feature_properties.g.dart';

@freezed
abstract class FeatureProperties with _$FeatureProperties {
  factory FeatureProperties({
    required String mapboxId,
    String? wikidata,
  }) = _FeatureProperties;
  factory FeatureProperties.fromJson(Map<String, dynamic> json) =>
      _$FeaturePropertiesFromJson(json);
}
