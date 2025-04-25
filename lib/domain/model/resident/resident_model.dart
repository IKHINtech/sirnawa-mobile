import 'package:freezed_annotation/freezed_annotation.dart';

part 'resident_model.freezed.dart';
part 'resident_model.g.dart';

@freezed
class ResidentModel with _$ResidentModel {
  const factory ResidentModel({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required String name,
    required String nik,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required String gender,
    @JsonKey(name: 'birth_date') required DateTime birthDate,
    required String job,
    @JsonKey(name: 'is_head_of_family') required bool isHeadOfFamily,
  }) = _ResidentModel;

  factory ResidentModel.fromJson(Map<String, dynamic> json) =>
      _$ResidentModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
