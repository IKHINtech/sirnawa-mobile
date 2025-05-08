import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_request_model.freezed.dart';
part 'announcement_request_model.g.dart';

@freezed
class AnnouncementRequestModel with _$AnnouncementRequestModel {
  const factory AnnouncementRequestModel({
    String? id,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'created_by') required String createdBy,
    required String content,
    required String title,
    required List<String> attachments,
  }) = _AnnouncementRequestModel;

  factory AnnouncementRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementRequestModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
