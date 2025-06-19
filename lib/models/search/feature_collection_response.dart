import 'package:freezed_annotation/freezed_annotation.dart';

import 'feature_model/feature_model.dart';

part 'feature_collection_response.freezed.dart';
part 'feature_collection_response.g.dart';

@freezed
abstract class FeatureCollectionResponse with _$FeatureCollectionResponse {
  factory FeatureCollectionResponse({
    required String type,
    required List<String> query,
    required List<FeatureModel> features,
    required String attribution,
  }) = _FeatureCollectionResponse;
  factory FeatureCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$FeatureCollectionResponseFromJson(json);
}
