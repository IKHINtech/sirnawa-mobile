import 'package:sirnawa_mobile/data/repositories/ipl_bill/ipl_bill_repository.dart';
import 'package:sirnawa_mobile/data/services/api/ipl_bill_services.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_bill/ipl_bill_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_bill_generate_request_model/ipl_bill_generate_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_bill/ipl_bill_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class IplBillRepositoryRemote implements IplBillRepository {
  IplBillRepositoryRemote({required IplBillService iplBillService})
    : _iplBillService = iplBillService;

  final IplBillService _iplBillService;

  @override
  Future<Result<ApiResponse<List<IplBillModel>>>> getList(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _iplBillService.getIplBills(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createIplBill(IplBillRequestModel iplBill) async {
    try {
      return await _iplBillService.createIplBill(iplBill);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> generate(IplBillGenerateRequestModel iplBill) async {
    try {
      return await _iplBillService.generateIplBill(iplBill);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateIplBill(
    String id,
    IplBillRequestModel iplBill,
  ) async {
    try {
      return await _iplBillService.updateIplBill(id, iplBill);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _iplBillService.deleteIplBill(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
