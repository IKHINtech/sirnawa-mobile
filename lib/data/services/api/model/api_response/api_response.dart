import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sirnawa_mobile/data/services/api/model/meta_response/meta_response.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    T? data, // <- Generic type
    required String message,
    MetaResponse? meta,
    required String status,
  }) = _ApiResponse<T>;

  // Custom fromJson untuk handle generic type
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiResponseFromJson<T>(json, fromJsonT);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
