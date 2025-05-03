import 'package:freezed_annotation/freezed_annotation.dart';

part 'ronda_group_request_model.freezed.dart';
part 'ronda_group_request_model.g.dart';

@freezed
class RondaGroupRequestModel with _$RondaGroupRequestModel {
  const factory RondaGroupRequestModel({
    required String id,
    @JsonKey(name: 'rt_id') required String rtId,
    required String name,
  }) = _RondaGroupRequestModel;

  factory RondaGroupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RondaGroupRequestModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
