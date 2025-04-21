import 'package:sirnawa_mobile/data/repositories/user/user_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/user_services.dart';
import 'package:sirnawa_mobile/domain/model/user/user_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class UserRepositoryRemote extends UserRepository {
  UserRepositoryRemote({required UserService userService})
    : _userService = userService;

  final UserService _userService;

  @override
  Future<Result<ApiResponse<UserModel>>> getCurrentUser() async {
    final result = await _userService.getCurrentUser();
    return result;
  }
}
