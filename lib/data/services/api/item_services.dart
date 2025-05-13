import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/item/item_request_model.dart';
import 'package:sirnawa_mobile/domain/model/item/item_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ItemService {
  final ApiClient apiClient;

  ItemService(this.apiClient);

  // ✅ GET /item
  Future<Result<ApiResponse<List<ItemModel>>>> getItems(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/item',
        queryParams: queryParams,
      );

      final ApiResponse<List<ItemModel>> data =
          ApiResponse<List<ItemModel>>.fromJson(
            response.data,
            (json) =>
                (json as List)
                    .map<ItemModel>(
                      (e) => ItemModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          );

      return Result<ApiResponse<List<ItemModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<ItemModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /item
  Future<Result<ApiResponse<ItemModel>>> createItem(
    ItemRequestModel payload,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/item',
        data: payload.toJson(),
      );

      final ApiResponse<ItemModel> data = ApiResponse<ItemModel>.fromJson(
        response.data,
        (json) => ItemModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<ItemModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<ItemModel>>.error(Exception(parseDioError(e)));
    }
  }

  // ✅ PUT /item/{id}
  Future<Result<ApiResponse<ItemModel>>> updateItem(
    String id,
    ItemRequestModel rt,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/item/$id',
        data: rt.toJson(),
      );

      final ApiResponse<ItemModel> data = ApiResponse<ItemModel>.fromJson(
        response.data,
        (json) => ItemModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<ItemModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<ItemModel>>.error(Exception(parseDioError(e)));
    }
  }

  // ✅ DELETE /item/{id}
  Future<Result<void>> deleteItem(String id) async {
    try {
      await apiClient.delete('/item/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}
