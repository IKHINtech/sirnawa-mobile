// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resident_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResidentModel {

 String get id;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'house_id') String get houseId; String get name; String get nik;@JsonKey(name: 'phone_number') String get phoneNumber; String get gender;@JsonKey(name: 'birth_date') DateTime get birthDate; String get job;@JsonKey(name: 'is_head_of_family') bool get isHeadOfFamily;
/// Create a copy of ResidentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidentModelCopyWith<ResidentModel> get copyWith => _$ResidentModelCopyWithImpl<ResidentModel>(this as ResidentModel, _$identity);

  /// Serializes this ResidentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResidentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.name, name) || other.name == name)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.job, job) || other.job == job)&&(identical(other.isHeadOfFamily, isHeadOfFamily) || other.isHeadOfFamily == isHeadOfFamily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,houseId,name,nik,phoneNumber,gender,birthDate,job,isHeadOfFamily);

@override
String toString() {
  return 'ResidentModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, houseId: $houseId, name: $name, nik: $nik, phoneNumber: $phoneNumber, gender: $gender, birthDate: $birthDate, job: $job, isHeadOfFamily: $isHeadOfFamily)';
}


}

/// @nodoc
abstract mixin class $ResidentModelCopyWith<$Res>  {
  factory $ResidentModelCopyWith(ResidentModel value, $Res Function(ResidentModel) _then) = _$ResidentModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'house_id') String houseId, String name, String nik,@JsonKey(name: 'phone_number') String phoneNumber, String gender,@JsonKey(name: 'birth_date') DateTime birthDate, String job,@JsonKey(name: 'is_head_of_family') bool isHeadOfFamily
});




}
/// @nodoc
class _$ResidentModelCopyWithImpl<$Res>
    implements $ResidentModelCopyWith<$Res> {
  _$ResidentModelCopyWithImpl(this._self, this._then);

  final ResidentModel _self;
  final $Res Function(ResidentModel) _then;

/// Create a copy of ResidentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? houseId = null,Object? name = null,Object? nik = null,Object? phoneNumber = null,Object? gender = null,Object? birthDate = null,Object? job = null,Object? isHeadOfFamily = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String,isHeadOfFamily: null == isHeadOfFamily ? _self.isHeadOfFamily : isHeadOfFamily // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ResidentModel implements ResidentModel {
  const _ResidentModel({required this.id, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'house_id') required this.houseId, required this.name, required this.nik, @JsonKey(name: 'phone_number') required this.phoneNumber, required this.gender, @JsonKey(name: 'birth_date') required this.birthDate, required this.job, @JsonKey(name: 'is_head_of_family') required this.isHeadOfFamily});
  factory _ResidentModel.fromJson(Map<String, dynamic> json) => _$ResidentModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'house_id') final  String houseId;
@override final  String name;
@override final  String nik;
@override@JsonKey(name: 'phone_number') final  String phoneNumber;
@override final  String gender;
@override@JsonKey(name: 'birth_date') final  DateTime birthDate;
@override final  String job;
@override@JsonKey(name: 'is_head_of_family') final  bool isHeadOfFamily;

/// Create a copy of ResidentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResidentModelCopyWith<_ResidentModel> get copyWith => __$ResidentModelCopyWithImpl<_ResidentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResidentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResidentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.name, name) || other.name == name)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.job, job) || other.job == job)&&(identical(other.isHeadOfFamily, isHeadOfFamily) || other.isHeadOfFamily == isHeadOfFamily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,houseId,name,nik,phoneNumber,gender,birthDate,job,isHeadOfFamily);

@override
String toString() {
  return 'ResidentModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, houseId: $houseId, name: $name, nik: $nik, phoneNumber: $phoneNumber, gender: $gender, birthDate: $birthDate, job: $job, isHeadOfFamily: $isHeadOfFamily)';
}


}

/// @nodoc
abstract mixin class _$ResidentModelCopyWith<$Res> implements $ResidentModelCopyWith<$Res> {
  factory _$ResidentModelCopyWith(_ResidentModel value, $Res Function(_ResidentModel) _then) = __$ResidentModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'house_id') String houseId, String name, String nik,@JsonKey(name: 'phone_number') String phoneNumber, String gender,@JsonKey(name: 'birth_date') DateTime birthDate, String job,@JsonKey(name: 'is_head_of_family') bool isHeadOfFamily
});




}
/// @nodoc
class __$ResidentModelCopyWithImpl<$Res>
    implements _$ResidentModelCopyWith<$Res> {
  __$ResidentModelCopyWithImpl(this._self, this._then);

  final _ResidentModel _self;
  final $Res Function(_ResidentModel) _then;

/// Create a copy of ResidentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? houseId = null,Object? name = null,Object? nik = null,Object? phoneNumber = null,Object? gender = null,Object? birthDate = null,Object? job = null,Object? isHeadOfFamily = null,}) {
  return _then(_ResidentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String,isHeadOfFamily: null == isHeadOfFamily ? _self.isHeadOfFamily : isHeadOfFamily // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
