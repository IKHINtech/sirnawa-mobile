import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sirnawa_mobile/data/services/api/model/access_token/access_token.dart';
import 'package:sirnawa_mobile/domain/model/user/user_model.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required UserModel user,
    @JsonKey(name: 'access_token') required AccessToken accessToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
