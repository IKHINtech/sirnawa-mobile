import 'dart:io';

import 'package:sirnawa_mobile/data/repositories/announcement/announcement_repository.dart';
import 'package:sirnawa_mobile/data/services/api/announcement_services.dart';
import 'package:sirnawa_mobile/data/services/api/model/announcement/announcement_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/announcement/announcement_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class AnnouncementRepositoryRemote implements AnnouncementRepository {
  AnnouncementRepositoryRemote({
    required AnnouncementService announcementService,
  }) : _announcementService = announcementService;

  final AnnouncementService _announcementService;

  @override
  Future<Result<ApiResponse<List<AnnouncementModel>>>> getListAnnouncement(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _announcementService.getAnnouncements(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createAnnouncement(
    AnnouncementRequestModel announcement,
    List<File> attachments,
  ) async {
    try {
      return await _announcementService.createAnnouncement(
        announcement,
        attachments,
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateAnnouncement(
    String id,
    AnnouncementRequestModel announcement,
  ) async {
    try {
      return await _announcementService.updateAnnouncement(id, announcement);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _announcementService.deleteAnnouncement(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
