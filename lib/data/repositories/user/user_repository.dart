import 'package:flutter/material.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/user/user_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class UserRepository extends ChangeNotifier {
  Future<Result<ApiResponse<UserModel>>> getCurrentUser();
}
