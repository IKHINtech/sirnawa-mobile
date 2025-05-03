// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnouncementRequestModel _$AnnouncementRequestModelFromJson(
  Map<String, dynamic> json,
) => _AnnouncementRequestModel(
  id: json['id'] as String?,
  rtId: json['rt_id'] as String,
  createdBy: json['created_by'] as String,
  content: json['content'] as String,
  title: json['title'] as String,
  attachments:
      (json['attachments'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$AnnouncementRequestModelToJson(
  _AnnouncementRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'rt_id': instance.rtId,
  'created_by': instance.createdBy,
  'content': instance.content,
  'title': instance.title,
  'attachments': instance.attachments,
};
