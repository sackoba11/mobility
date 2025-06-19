import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop.freezed.dart';
part 'stop.g.dart';

@freezed
abstract class Stop with _$Stop {
  factory Stop({
    required double lat,
    required double long,
  }) = _Stop;
  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);
}
