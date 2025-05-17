import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_request_model.freezed.dart';
part 'notification_request_model.g.dart';

@freezed
class NotificationRequestModel with _$NotificationRequestModel {
  const factory NotificationRequestModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'house_id') String? houseId,
    @JsonKey(name: 'rt_id') String? rtId,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'body') required String body,
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'data') required Map<String, dynamic> data,
    @JsonKey(name: 'read_at') DateTime? readAt,
  }) = _NotificationRequestModel;

  factory NotificationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationRequestModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
