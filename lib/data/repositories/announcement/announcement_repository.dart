import 'dart:io';

import 'package:sirnawa_mobile/data/services/api/model/announcement/announcement_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/announcement/announcement_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class AnnouncementRepository {
  Future<Result<ApiResponse<List<AnnouncementModel>>>> getListAnnouncement(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createAnnouncement(
    AnnouncementRequestModel announcement,
    List<File> attachments,
  );
  Future<Result<void>> updateAnnouncement(
    String id,
    AnnouncementRequestModel announcement,
  );
  Future<Result<void>> delete(String id);
}
