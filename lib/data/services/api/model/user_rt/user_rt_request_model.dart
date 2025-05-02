import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_rt_request_model.freezed.dart';
part 'user_rt_request_model.g.dart';

@freezed
class UserRtRequestModel with _$UserRtRequestModel {
  const factory UserRtRequestModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'role') required String role,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'user_id') required String userId,
  }) = _UserRtRequestModel;

  factory UserRtRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserRtRequestModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
