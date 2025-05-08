import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/announcement/announcement_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/announcement/announcement_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class AnnouncementService {
  final ApiClient apiClient;

  AnnouncementService(this.apiClient);

  // ✅ GET /announcement
  Future<Result<ApiResponse<List<AnnouncementModel>>>> getAnnouncements(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/announcement',
        queryParams: queryParams,
      );

      final ApiResponse<List<AnnouncementModel>> data =
          ApiResponse<List<AnnouncementModel>>.fromJson(
            response.data,
            (json) =>
                (json as List)
                    .map<AnnouncementModel>(
                      (e) =>
                          AnnouncementModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          );

      return Result<ApiResponse<List<AnnouncementModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<AnnouncementModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  Future<Result<ApiResponse<AnnouncementModel>>> createAnnouncement(
    AnnouncementRequestModel announcement,
    List<File> attachments,
  ) async {
    try {
      // Konversi ke FormData
      final formData = FormData.fromMap({
        'rt_id': announcement.rtId,
        'title': announcement.title,
        'content': announcement.content,
        "created_by": announcement.createdBy,
        if (attachments.isNotEmpty)
          'attachments': [
            for (final file in attachments)
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
              ),
          ],
      });

      final response = await apiClient.post(
        '/announcement',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      final ApiResponse<AnnouncementModel> data =
          ApiResponse<AnnouncementModel>.fromJson(
            response.data,
            (json) => AnnouncementModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<AnnouncementModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<AnnouncementModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ PUT /announcement/{id}
  Future<Result<ApiResponse<AnnouncementModel>>> updateAnnouncement(
    String id,
    AnnouncementRequestModel announcement,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/announcement/$id',
        data: announcement.toJson(),
      );

      final ApiResponse<AnnouncementModel> data =
          ApiResponse<AnnouncementModel>.fromJson(
            response.data,
            (json) => AnnouncementModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<AnnouncementModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<AnnouncementModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ DELETE /announcement/{id}
  Future<Result<void>> deleteAnnouncement(String id) async {
    try {
      await apiClient.delete('/announcement/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // Helper error parser
}
