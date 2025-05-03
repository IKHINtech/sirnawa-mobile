// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnouncementRequestModel {

 String? get id;@JsonKey(name: 'rt_id') String get rtId;@JsonKey(name: 'created_by') String get createdBy; String get content; String get title; List<String> get attachments;
/// Create a copy of AnnouncementRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnouncementRequestModelCopyWith<AnnouncementRequestModel> get copyWith => _$AnnouncementRequestModelCopyWithImpl<AnnouncementRequestModel>(this as AnnouncementRequestModel, _$identity);

  /// Serializes this AnnouncementRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnouncementRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.content, content) || other.content == content)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.attachments, attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rtId,createdBy,content,title,const DeepCollectionEquality().hash(attachments));

@override
String toString() {
  return 'AnnouncementRequestModel(id: $id, rtId: $rtId, createdBy: $createdBy, content: $content, title: $title, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $AnnouncementRequestModelCopyWith<$Res>  {
  factory $AnnouncementRequestModelCopyWith(AnnouncementRequestModel value, $Res Function(AnnouncementRequestModel) _then) = _$AnnouncementRequestModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'created_by') String createdBy, String content, String title, List<String> attachments
});




}
/// @nodoc
class _$AnnouncementRequestModelCopyWithImpl<$Res>
    implements $AnnouncementRequestModelCopyWith<$Res> {
  _$AnnouncementRequestModelCopyWithImpl(this._self, this._then);

  final AnnouncementRequestModel _self;
  final $Res Function(AnnouncementRequestModel) _then;

/// Create a copy of AnnouncementRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? rtId = null,Object? createdBy = null,Object? content = null,Object? title = null,Object? attachments = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AnnouncementRequestModel implements AnnouncementRequestModel {
  const _AnnouncementRequestModel({this.id, @JsonKey(name: 'rt_id') required this.rtId, @JsonKey(name: 'created_by') required this.createdBy, required this.content, required this.title, required final  List<String> attachments}): _attachments = attachments;
  factory _AnnouncementRequestModel.fromJson(Map<String, dynamic> json) => _$AnnouncementRequestModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override@JsonKey(name: 'created_by') final  String createdBy;
@override final  String content;
@override final  String title;
 final  List<String> _attachments;
@override List<String> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}


/// Create a copy of AnnouncementRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnouncementRequestModelCopyWith<_AnnouncementRequestModel> get copyWith => __$AnnouncementRequestModelCopyWithImpl<_AnnouncementRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnouncementRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnouncementRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.content, content) || other.content == content)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rtId,createdBy,content,title,const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'AnnouncementRequestModel(id: $id, rtId: $rtId, createdBy: $createdBy, content: $content, title: $title, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$AnnouncementRequestModelCopyWith<$Res> implements $AnnouncementRequestModelCopyWith<$Res> {
  factory _$AnnouncementRequestModelCopyWith(_AnnouncementRequestModel value, $Res Function(_AnnouncementRequestModel) _then) = __$AnnouncementRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'created_by') String createdBy, String content, String title, List<String> attachments
});




}
/// @nodoc
class __$AnnouncementRequestModelCopyWithImpl<$Res>
    implements _$AnnouncementRequestModelCopyWith<$Res> {
  __$AnnouncementRequestModelCopyWithImpl(this._self, this._then);

  final _AnnouncementRequestModel _self;
  final $Res Function(_AnnouncementRequestModel) _then;

/// Create a copy of AnnouncementRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? rtId = null,Object? createdBy = null,Object? content = null,Object? title = null,Object? attachments = null,}) {
  return _then(_AnnouncementRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
