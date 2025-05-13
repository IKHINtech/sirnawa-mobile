import 'package:sirnawa_mobile/data/repositories/item/item_repository.dart';
import 'package:sirnawa_mobile/data/services/api/item_services.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/item/item_request_model.dart';
import 'package:sirnawa_mobile/domain/model/item/item_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ItemRepositoryRemote implements ItemRepository {
  ItemRepositoryRemote({required ItemService itemService})
    : _itemService = itemService;

  final ItemService _itemService;

  @override
  Future<Result<ApiResponse<List<ItemModel>>>> getList(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _itemService.getItems(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createItem(ItemRequestModel item) async {
    try {
      return await _itemService.createItem(item);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateItem(String id, ItemRequestModel item) async {
    try {
      return await _itemService.updateItem(id, item);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _itemService.deleteItem(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
