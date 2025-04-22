import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sirnawa_mobile/config/app_config.dart';
import 'package:sirnawa_mobile/data/repositories/auth/auth_repository.dart';
import 'package:sirnawa_mobile/data/repositories/auth/auth_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/rt/rt_repository.dart';
import 'package:sirnawa_mobile/data/repositories/rt/rt_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/auth_api_client.dart';
import 'package:sirnawa_mobile/data/services/api/rt_services.dart';
import 'package:sirnawa_mobile/data/services/api/user_services.dart';
import 'package:sirnawa_mobile/data/services/share_preference_service.dart';
import 'package:sirnawa_mobile/ui/admin/rt/rt_viewmodel/rt_viewmodel.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

List<SingleChildWidget> get providersRemote {
  return <SingleChildWidget>[
    Provider<AuthApiClient>(create: (BuildContext context) => AuthApiClient()),
    Provider<ApiClient>(
      create:
          (BuildContext context) => ApiClient(baseUrl: AppConfig.apiBaseUrl),
    ),
    Provider<SharedPreferencesService>(
      create: (context) => SharedPreferencesService(),
    ),
    ChangeNotifierProvider<AuthRepository>(
      create:
          (BuildContext context) =>
              AuthRepositoryRemote(
                    userService: UserService(context.read<ApiClient>()),
                    authApiClient: context.read<AuthApiClient>(),
                    apiClient: context.read<ApiClient>(),
                    sharedPreferencesService:
                        context.read<SharedPreferencesService>(),
                  )
                  as AuthRepository,
    ),
    Provider<RtRepository>(
      create:
          (context) =>
              RtRepositoryRemote(
                    rtService: RtService(context.read<ApiClient>()),
                  )
                  as RtRepository,
    ),
    ChangeNotifierProvider<UserRepository>(
      create:
          (BuildContext context) =>
              UserRepositoryRemote(
                    userService: UserService(context.read<ApiClient>()),
                  )
                  as UserRepository,
    ),
    ChangeNotifierProvider<HomeViewmodel>(
      create:
          (BuildContext context) =>
              HomeViewmodel(userRepo: context.read<UserRepository>()),
    ),
    ChangeNotifierProvider<RtViewModel>(
      create:
          (BuildContext context) =>
              RtViewModel(rtRepo: context.read<RtRepository>()),
    ),
  ];
}
