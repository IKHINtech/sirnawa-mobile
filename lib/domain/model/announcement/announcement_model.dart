import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_model.freezed.dart';
part 'announcement_model.g.dart';

@freezed
class AnnouncementModel with _$AnnouncementModel {
  const factory AnnouncementModel({
    required String id,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'created_by') required String createdBy,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required String content,
    required String title,
    required String creator,
    required List<String>? attachments,
    @JsonKey(name: 'attachment_urls') required List<String> attachmentUrls,
  }) = _AnnouncementModel;

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
