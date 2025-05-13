import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/item/item_request_model.dart';
import 'package:sirnawa_mobile/domain/model/item/item_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class ItemRepository {
  Future<Result<ApiResponse<List<ItemModel>>>> getList(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createItem(ItemRequestModel item);
  Future<Result<void>> updateItem(String id, ItemRequestModel item);
  Future<Result<void>> delete(String id);
}
