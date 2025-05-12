// ========== Ronda Group Member ========== //

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_group_member/ronda_group_member_repository.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_group_member/ronda_group_member_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/ronda_group_member_service.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_group_member/view_models/ronda_group_member_viewmodel.dart';

final Provider<RondaGroupMemberService> rondaGroupMemberServiceProvider =
    Provider<RondaGroupMemberService>((Ref<RondaGroupMemberService> ref) {
      return RondaGroupMemberService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<RondaGroupMemberRepository> rondaGroupMemberRepositoryProvider =
    Provider<RondaGroupMemberRepository>((Ref<RondaGroupMemberRepository> ref) {
      return RondaGroupMemberRepositoryRemote(
        rondaGroupMemberService: ref.read<RondaGroupMemberService>(
          rondaGroupMemberServiceProvider,
        ),
      );
    });

final StateNotifierProvider<RondaGroupMemberViewModel, RondaGroupMemberState>
rondaGroupMemberViewModelProvider = StateNotifierProvider<
  RondaGroupMemberViewModel,
  RondaGroupMemberState
>((ref) {
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return RondaGroupMemberViewModel(
    repository: ref.read<RondaGroupMemberRepository>(
      rondaGroupMemberRepositoryProvider,
    ),
    gropuID: rtId,
  );
});
