// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resident_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResidentRequestModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'nik') String get nik;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'email') String? get email;@JsonKey(name: 'birth_date') String get birthDate;// format: yyyy-MM-dd
@JsonKey(name: 'gender') String get gender;@JsonKey(name: 'job') String get job;@JsonKey(name: 'is_head_of_family') bool get isHeadOfFamily;@JsonKey(name: 'role') String get role;
/// Create a copy of ResidentRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidentRequestModelCopyWith<ResidentRequestModel> get copyWith => _$ResidentRequestModelCopyWithImpl<ResidentRequestModel>(this as ResidentRequestModel, _$identity);

  /// Serializes this ResidentRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResidentRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.job, job) || other.job == job)&&(identical(other.isHeadOfFamily, isHeadOfFamily) || other.isHeadOfFamily == isHeadOfFamily)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nik,phoneNumber,email,birthDate,gender,job,isHeadOfFamily,role);

@override
String toString() {
  return 'ResidentRequestModel(id: $id, name: $name, nik: $nik, phoneNumber: $phoneNumber, email: $email, birthDate: $birthDate, gender: $gender, job: $job, isHeadOfFamily: $isHeadOfFamily, role: $role)';
}


}

/// @nodoc
abstract mixin class $ResidentRequestModelCopyWith<$Res>  {
  factory $ResidentRequestModelCopyWith(ResidentRequestModel value, $Res Function(ResidentRequestModel) _then) = _$ResidentRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'name') String name,@JsonKey(name: 'nik') String nik,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'email') String? email,@JsonKey(name: 'birth_date') String birthDate,@JsonKey(name: 'gender') String gender,@JsonKey(name: 'job') String job,@JsonKey(name: 'is_head_of_family') bool isHeadOfFamily,@JsonKey(name: 'role') String role
});




}
/// @nodoc
class _$ResidentRequestModelCopyWithImpl<$Res>
    implements $ResidentRequestModelCopyWith<$Res> {
  _$ResidentRequestModelCopyWithImpl(this._self, this._then);

  final ResidentRequestModel _self;
  final $Res Function(ResidentRequestModel) _then;

/// Create a copy of ResidentRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? nik = null,Object? phoneNumber = freezed,Object? email = freezed,Object? birthDate = null,Object? gender = null,Object? job = null,Object? isHeadOfFamily = null,Object? role = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String,isHeadOfFamily: null == isHeadOfFamily ? _self.isHeadOfFamily : isHeadOfFamily // ignore: cast_nullable_to_non_nullable
as bool,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ResidentRequestModel implements ResidentRequestModel {
  const _ResidentRequestModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'nik') required this.nik, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'email') this.email, @JsonKey(name: 'birth_date') required this.birthDate, @JsonKey(name: 'gender') required this.gender, @JsonKey(name: 'job') required this.job, @JsonKey(name: 'is_head_of_family') required this.isHeadOfFamily, @JsonKey(name: 'role') required this.role});
  factory _ResidentRequestModel.fromJson(Map<String, dynamic> json) => _$ResidentRequestModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'nik') final  String nik;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'email') final  String? email;
@override@JsonKey(name: 'birth_date') final  String birthDate;
// format: yyyy-MM-dd
@override@JsonKey(name: 'gender') final  String gender;
@override@JsonKey(name: 'job') final  String job;
@override@JsonKey(name: 'is_head_of_family') final  bool isHeadOfFamily;
@override@JsonKey(name: 'role') final  String role;

/// Create a copy of ResidentRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResidentRequestModelCopyWith<_ResidentRequestModel> get copyWith => __$ResidentRequestModelCopyWithImpl<_ResidentRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResidentRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResidentRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.job, job) || other.job == job)&&(identical(other.isHeadOfFamily, isHeadOfFamily) || other.isHeadOfFamily == isHeadOfFamily)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nik,phoneNumber,email,birthDate,gender,job,isHeadOfFamily,role);

@override
String toString() {
  return 'ResidentRequestModel(id: $id, name: $name, nik: $nik, phoneNumber: $phoneNumber, email: $email, birthDate: $birthDate, gender: $gender, job: $job, isHeadOfFamily: $isHeadOfFamily, role: $role)';
}


}

/// @nodoc
abstract mixin class _$ResidentRequestModelCopyWith<$Res> implements $ResidentRequestModelCopyWith<$Res> {
  factory _$ResidentRequestModelCopyWith(_ResidentRequestModel value, $Res Function(_ResidentRequestModel) _then) = __$ResidentRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'name') String name,@JsonKey(name: 'nik') String nik,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'email') String? email,@JsonKey(name: 'birth_date') String birthDate,@JsonKey(name: 'gender') String gender,@JsonKey(name: 'job') String job,@JsonKey(name: 'is_head_of_family') bool isHeadOfFamily,@JsonKey(name: 'role') String role
});




}
/// @nodoc
class __$ResidentRequestModelCopyWithImpl<$Res>
    implements _$ResidentRequestModelCopyWith<$Res> {
  __$ResidentRequestModelCopyWithImpl(this._self, this._then);

  final _ResidentRequestModel _self;
  final $Res Function(_ResidentRequestModel) _then;

/// Create a copy of ResidentRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? nik = null,Object? phoneNumber = freezed,Object? email = freezed,Object? birthDate = null,Object? gender = null,Object? job = null,Object? isHeadOfFamily = null,Object? role = null,}) {
  return _then(_ResidentRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String,isHeadOfFamily: null == isHeadOfFamily ? _self.isHeadOfFamily : isHeadOfFamily // ignore: cast_nullable_to_non_nullable
as bool,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
