import 'package:flutter/material.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/user/user_model.dart';
import 'package:sirnawa_mobile/utils/command.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class HomeViewmodel extends ChangeNotifier {
  HomeViewmodel({required UserRepository userRepo}) : _userRepo = userRepo {
    loadUser = Command0(_fetchCurrentUser)..execute();
  }
  final UserRepository _userRepo;

  bool _isLoading = false;
  String? _error;
  UserModel? _user;

  bool get isLoading => _isLoading;
  String? get error => _error;
  UserModel? get user => _user;
  late final Command0 loadUser;

  Future<Result<void>> _fetchCurrentUser() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _userRepo.getCurrentUser();

    if (result is Ok<ApiResponse<UserModel>>) {
      final apiResponse = result.value;
      _user = apiResponse.data;
    } else if (result is Error<ApiResponse<UserModel>>) {
      _error = result.error.toString();
    }

    _isLoading = false;
    notifyListeners();

    return _error != null
        ? Result.error(Exception(_error))
        : const Result.ok(null);
  }
}
