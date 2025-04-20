import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_response.freezed.dart';
part 'meta_response.g.dart';

@freezed
class MetaResponse with _$MetaResponse {
  const factory MetaResponse({
    required int limit,
    required int page,
    required String sort,
    @JsonKey(name: "sort_by") required String sortBy,
    @JsonKey(name: "total_pages") required int totalPages,
    @JsonKey(name: "total_rows") required int totalRows,
  }) = _MetaResponse;
  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
