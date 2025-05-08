// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnouncementModel {

 String get id;@JsonKey(name: 'rt_id') String get rtId;@JsonKey(name: 'created_by') String get createdBy;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; String get content; String get title; String get creator; List<String>? get attachments;@JsonKey(name: 'attachment_urls') List<String> get attachmentUrls;
/// Create a copy of AnnouncementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnouncementModelCopyWith<AnnouncementModel> get copyWith => _$AnnouncementModelCopyWithImpl<AnnouncementModel>(this as AnnouncementModel, _$identity);

  /// Serializes this AnnouncementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnouncementModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.content, content) || other.content == content)&&(identical(other.title, title) || other.title == title)&&(identical(other.creator, creator) || other.creator == creator)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&const DeepCollectionEquality().equals(other.attachmentUrls, attachmentUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rtId,createdBy,createdAt,updatedAt,content,title,creator,const DeepCollectionEquality().hash(attachments),const DeepCollectionEquality().hash(attachmentUrls));

@override
String toString() {
  return 'AnnouncementModel(id: $id, rtId: $rtId, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, content: $content, title: $title, creator: $creator, attachments: $attachments, attachmentUrls: $attachmentUrls)';
}


}

/// @nodoc
abstract mixin class $AnnouncementModelCopyWith<$Res>  {
  factory $AnnouncementModelCopyWith(AnnouncementModel value, $Res Function(AnnouncementModel) _then) = _$AnnouncementModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String content, String title, String creator, List<String>? attachments,@JsonKey(name: 'attachment_urls') List<String> attachmentUrls
});




}
/// @nodoc
class _$AnnouncementModelCopyWithImpl<$Res>
    implements $AnnouncementModelCopyWith<$Res> {
  _$AnnouncementModelCopyWithImpl(this._self, this._then);

  final AnnouncementModel _self;
  final $Res Function(AnnouncementModel) _then;

/// Create a copy of AnnouncementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rtId = null,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = null,Object? content = null,Object? title = null,Object? creator = null,Object? attachments = freezed,Object? attachmentUrls = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as String,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,attachmentUrls: null == attachmentUrls ? _self.attachmentUrls : attachmentUrls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AnnouncementModel implements AnnouncementModel {
  const _AnnouncementModel({required this.id, @JsonKey(name: 'rt_id') required this.rtId, @JsonKey(name: 'created_by') required this.createdBy, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.content, required this.title, required this.creator, required final  List<String>? attachments, @JsonKey(name: 'attachment_urls') required final  List<String> attachmentUrls}): _attachments = attachments,_attachmentUrls = attachmentUrls;
  factory _AnnouncementModel.fromJson(Map<String, dynamic> json) => _$AnnouncementModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override@JsonKey(name: 'created_by') final  String createdBy;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override final  String content;
@override final  String title;
@override final  String creator;
 final  List<String>? _attachments;
@override List<String>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String> _attachmentUrls;
@override@JsonKey(name: 'attachment_urls') List<String> get attachmentUrls {
  if (_attachmentUrls is EqualUnmodifiableListView) return _attachmentUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachmentUrls);
}


/// Create a copy of AnnouncementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnouncementModelCopyWith<_AnnouncementModel> get copyWith => __$AnnouncementModelCopyWithImpl<_AnnouncementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnouncementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnouncementModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.content, content) || other.content == content)&&(identical(other.title, title) || other.title == title)&&(identical(other.creator, creator) || other.creator == creator)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&const DeepCollectionEquality().equals(other._attachmentUrls, _attachmentUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rtId,createdBy,createdAt,updatedAt,content,title,creator,const DeepCollectionEquality().hash(_attachments),const DeepCollectionEquality().hash(_attachmentUrls));

@override
String toString() {
  return 'AnnouncementModel(id: $id, rtId: $rtId, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, content: $content, title: $title, creator: $creator, attachments: $attachments, attachmentUrls: $attachmentUrls)';
}


}

/// @nodoc
abstract mixin class _$AnnouncementModelCopyWith<$Res> implements $AnnouncementModelCopyWith<$Res> {
  factory _$AnnouncementModelCopyWith(_AnnouncementModel value, $Res Function(_AnnouncementModel) _then) = __$AnnouncementModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String content, String title, String creator, List<String>? attachments,@JsonKey(name: 'attachment_urls') List<String> attachmentUrls
});




}
/// @nodoc
class __$AnnouncementModelCopyWithImpl<$Res>
    implements _$AnnouncementModelCopyWith<$Res> {
  __$AnnouncementModelCopyWithImpl(this._self, this._then);

  final _AnnouncementModel _self;
  final $Res Function(_AnnouncementModel) _then;

/// Create a copy of AnnouncementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rtId = null,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = null,Object? content = null,Object? title = null,Object? creator = null,Object? attachments = freezed,Object? attachmentUrls = null,}) {
  return _then(_AnnouncementModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as String,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,attachmentUrls: null == attachmentUrls ? _self._attachmentUrls : attachmentUrls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
