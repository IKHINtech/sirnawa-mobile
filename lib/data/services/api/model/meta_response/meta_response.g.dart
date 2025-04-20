// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) =>
    _MetaResponse(
      limit: (json['limit'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      sort: json['sort'] as String,
      sortBy: json['sort_by'] as String,
      totalPages: (json['total_pages'] as num).toInt(),
      totalRows: (json['total_rows'] as num).toInt(),
    );

Map<String, dynamic> _$MetaResponseToJson(_MetaResponse instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'sort': instance.sort,
      'sort_by': instance.sortBy,
      'total_pages': instance.totalPages,
      'total_rows': instance.totalRows,
    };
