import 'package:flutter/foundation.dart';
import 'package:sirnawa_mobile/data/repositories/rt/rt_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/rt/rt_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RtViewModel extends ChangeNotifier {
  RtViewModel({required RtRepository rtRepo}) : _repository = rtRepo;

  final RtRepository _repository;
  bool _isLoading = false;
  String? _error;
  List<RtModel> _list = [];

  int _currentPage = 1;
  final int _limit = 2;
  int _totalPages = 1;

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<RtModel> get list => _list;
  bool get hasNextPage => _currentPage < _totalPages;

  /// Reset and load from page 1
  Future<void> fetchListRt({bool reset = false}) async {
    try {
      if (_isLoading) return;

      if (reset) {
        _currentPage = 1;
        _list.clear();
        _totalPages = 1;
      }

      _isLoading = true;
      _error = null;

      final result = await _repository.getListRt({
        "page": _currentPage,
        "page_size": _limit,
      });

      switch (result) {
        case Ok<ApiResponse<List<RtModel>>>():
          _list = [..._list, ...(result.value.data ?? [])];
          _totalPages = result.value.meta?.totalPages ?? 1;
          _currentPage++;
          break;
        case Error<ApiResponse<List<RtModel>>>():
          _error = result.error.toString();
          break;
      }
    } catch (e) {
      _error = "Exception: $e";
    } finally {
      _isLoading = false;
      notifyListeners(); // hanya sekali di sini
    }
  }

  /// Load next page
  Future<void> loadMore() async {
    if (!hasNextPage || _isLoading) return;
    await fetchListRt(); // load page berikutnya
  }
}
