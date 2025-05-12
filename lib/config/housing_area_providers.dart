// ========== Housing Area ========== //
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/housing_area/housing_area_reposiory_remote.dart';
import 'package:sirnawa_mobile/data/repositories/housing_area/housing_area_repository.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/housing_area_services.dart';
import 'package:sirnawa_mobile/ui/admin/housing_area/housing_area_viewmodel/housing_area_viewmodel.dart';

final Provider<HousingAreaService> housingAreaServiceProvider =
    Provider<HousingAreaService>((Ref<HousingAreaService> ref) {
      return HousingAreaService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<HousingAreaRepository> housingAreaRepositoryProvider =
    Provider<HousingAreaRepository>((Ref<HousingAreaRepository> ref) {
      return HousingAreaRepositoryRemote(
        housingAreaService: ref.read<HousingAreaService>(
          housingAreaServiceProvider,
        ),
      );
    });

final StateNotifierProvider<HousingAreaViewModel, HousingAreaState>
housingAreaViewModelProvider =
    StateNotifierProvider<HousingAreaViewModel, HousingAreaState>((ref) {
      return HousingAreaViewModel(
        repository: ref.read<HousingAreaRepository>(
          housingAreaRepositoryProvider,
        ),
      );
    });
