import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_fcm_token_request_model.freezed.dart';
part 'user_fcm_token_request_model.g.dart';

@freezed
class UserFcmTokenRequestModel with _$UserFcmTokenRequestModel {
  const factory UserFcmTokenRequestModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'app_version') required String apVersion,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'os_version') required String osVersion,
    @JsonKey(name: 'device_type') required String deviceType,
    @JsonKey(name: 'token') required String token,
  }) = _UserFcmTokenRequestModel;

  factory UserFcmTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserFcmTokenRequestModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
