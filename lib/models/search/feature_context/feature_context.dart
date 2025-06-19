import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_context.freezed.dart';
part 'feature_context.g.dart';

@freezed
abstract class FeatureContext with _$FeatureContext {
  factory FeatureContext(
      {required String id,
      required String mapboxId,
      String? wikidata,
      required String shortCode,
      required String text}) = _FeatureContext;
  factory FeatureContext.fromJson(Map<String, dynamic> json) =>
      _$FeatureContextFromJson(json);
}
