// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      houseId: json['house_id'] as String?,
      rtId: json['rt_id'] as String?,
      title: json['title'] as String,
      body: json['body'] as String,
      category: json['category'] as String,
      data: json['data'] as Map<String, dynamic>,
      readAt:
          json['read_at'] == null
              ? null
              : DateTime.parse(json['read_at'] as String),
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'house_id': instance.houseId,
      'rt_id': instance.rtId,
      'title': instance.title,
      'body': instance.body,
      'category': instance.category,
      'data': instance.data,
      'read_at': instance.readAt?.toIso8601String(),
    };
