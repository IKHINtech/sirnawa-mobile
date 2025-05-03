import 'package:freezed_annotation/freezed_annotation.dart';

part 'resident_request_model.freezed.dart';
part 'resident_request_model.g.dart';

@freezed
class ResidentRequestModel with _$ResidentRequestModel {
  const factory ResidentRequestModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'nik') required String nik,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'birth_date')
    required String birthDate, // format: yyyy-MM-dd
    @JsonKey(name: 'gender') required String gender,
    @JsonKey(name: 'job') required String job,
    @JsonKey(name: 'is_head_of_family') required bool isHeadOfFamily,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'role')
    required String role, // Ex: 'warga', 'admin_rt', etc.
  }) = _ResidentRequestModel;

  factory ResidentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResidentRequestModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
