import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'house_id') String? houseId,
    @JsonKey(name: 'rt_id') String? rtId,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'body') required String body,
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'data') required Map<String, dynamic> data,
    @JsonKey(name: 'read_at') DateTime? readAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
