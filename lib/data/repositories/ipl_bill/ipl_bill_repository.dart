import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_bill/ipl_bill_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_bill_generate_request_model/ipl_bill_generate_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_bill/ipl_bill_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class IplBillRepository {
  Future<Result<ApiResponse<List<IplBillModel>>>> getList(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createIplBill(IplBillRequestModel item);
  Future<Result<void>> generate(IplBillGenerateRequestModel item);
  Future<Result<void>> updateIplBill(String id, IplBillRequestModel item);
  Future<Result<void>> delete(String id);
}
