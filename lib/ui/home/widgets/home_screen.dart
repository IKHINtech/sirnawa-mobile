import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_elevated_button.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_shimmer.dart';
import 'package:sirnawa_mobile/ui/core/ui/placeholder.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';
import 'package:sirnawa_mobile/ui/home/widgets/house_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _showHouseBottomSheet(
    BuildContext context,
    HomeState viewmodel,
    HomeViewModel notifier,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return HouseDetailBottomSheet(
          viewmodel: viewmodel,
          onSelect: (selectedHouse) {
            notifier.changeHouse(selectedHouse);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch<HomeState>(homeViewModelProvider);
    final notifier = ref.watch<HomeViewModel>(homeViewModelProvider.notifier);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.read(homeViewModelProvider.notifier).reloadUser(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.pexels.com/photos/259780/pexels-photo-259780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    // Overlay gelap biar teks/icon tetap terbaca
                    color: Colors.black.withValues(alpha: 0.3),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: kToolbarHeight),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16.0,
                          left: 16,
                          right: 16,
                        ),
                        child:
                            state.user == null && !state.isLoading
                                ? Card(
                                  child: ListTile(
                                    textColor: Colors.red,
                                    title: Row(
                                      children: [
                                        Text("Terjadi Kesalahan"),
                                        SizedBox(width: 8),
                                        Icon(Icons.error, color: Colors.red),
                                      ],
                                    ),
                                    trailing: IconButton(
                                      onPressed: () => notifier.logout(),
                                      icon: Icon(
                                        Icons.logout,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                )
                                : Column(
                                  children: [
                                    _title(context, state),
                                    const SizedBox(height: 8),
                                    _userLogin(context, state, notifier),
                                  ],
                                ),
                      ),
                    ],
                  ),
                ),
              ),
              _mainMenu(context, state),
              Container(
                height: 20,
                // color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ronda Minggu Ini",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.calendar_month,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Sabtu, 12 April 2025",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    SizedBox(height: 10),
                    Card.outlined(
                      child: ListTile(
                        title: Text("Group A"),
                        subtitle: Row(
                          children: [Icon(Icons.person), Text("3 Orang")],
                        ),
                        trailing: Icon(
                          Icons.security_rounded,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      title: "Lihat Jadwal Lengkap",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,

                //  color: Colors.white
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pengumuman",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          LucideIcons.bell,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Card.outlined(
                      child: ListTile(
                        title: Text("Kerja Bakti Rutin"),
                        subtitle: Text("lorem ipsum"),
                        trailing: Icon(Icons.info, color: Colors.blue),
                      ),
                    ),
                    CustomElevatedButton(
                      title: "Lihat Pengumuman Lain",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              Container(height: 20, color: Colors.white),
              _fiture(context),
            ],
          ),
        ),
      ),
    );
  }

  Container _fiture(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Statistik",
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
          ),
          GridView.count(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              _fitureItem(
                title: "IPL",
                icon: Icons.receipt_long,
                color: Colors.green[200]!,
                content: "3",
                onClick: () {},
              ),
              _fitureItem(
                title: "Rumah",
                icon: Icons.home,
                color: Colors.blue[200]!,
                content: "3",
                onClick: () {},
              ),
              _fitureItem(
                title: "Warga",
                icon: Icons.person,
                color: Colors.yellow[200]!,
                content: "100",
                onClick: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _mainMenu(BuildContext context, HomeState state) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              "Menu",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          GridView.count(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 4,
            children: <Widget>[
              _menuItem(
                onTab: () {},
                context,
                title: "IPL",
                icon: Icons.receipt_long,
              ),
              _menuItem(
                onTab: () {},
                context,
                title: "Rumah",
                color: Colors.green,
                icon: Icons.home,
              ),
              _menuItem(
                onTab: () {},
                context,
                title: "Ronda",
                color: Colors.redAccent,
                icon: Icons.security,
              ),
              _menuItem(
                onTab: () {
                  if (state.user?.role == "warga") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Akses admin hanya untuk pengurus"),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  } else {
                    context.push(Routes.admin);
                  }
                },
                context,
                title: "Admin",
                color: Colors.purple,
                icon: Icons.settings,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _userLogin(
    BuildContext context,
    HomeState viewmodel,
    HomeViewModel notifier,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  viewmodel.isLoading
                      ? CustomShimmer(
                        child: CircleAvatar(child: Icon(Icons.person_2)),
                      )
                      : CircleAvatar(child: Icon(Icons.person_2)),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      viewmodel.isLoading
                          ? CustomShimmer(
                            child: CustomPlaceholder(height: 18, width: 90),
                          )
                          : SizedBox(
                            width: 120,
                            child: Text(
                              " ${viewmodel.user?.resident?.name}",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                      viewmodel.isLoading
                          ? const SizedBox(height: 6)
                          : SizedBox(),
                      viewmodel.isLoading
                          ? CustomShimmer(
                            child: CustomPlaceholder(height: 12, width: 50),
                          )
                          : Text(
                            viewmodel.userRtModel?.role.toUpperCase() ?? "-",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                    ],
                  ),
                ],
              ),
            ),
            viewmodel.isLoading
                ? CustomShimmer(
                  child: _selectedHouse(context, viewmodel, notifier),
                )
                : _selectedHouse(context, viewmodel, notifier),
          ],
        ),
      ),
    );
  }

  Widget _selectedHouse(
    BuildContext context,
    HomeState viewmodel,
    HomeViewModel notifier,
  ) {
    return GestureDetector(
      onTap:
          () =>
              !viewmodel.isLoading
                  ? _showHouseBottomSheet(context, viewmodel, notifier)
                  : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.primary,
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${viewmodel.residentHouse?.house.block?.name} No. ${viewmodel.residentHouse?.house.number}",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(width: 8),
            const Icon(LucideIcons.home, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context, HomeState state) {
    return Column(
      children: [
        state.isLoading
            ? CustomShimmer(child: CustomPlaceholder(height: 28, width: 240))
            : Text(
              state.residentHouse != null
                  ? state.residentHouse?.house.hosuingArea?.name ?? "-"
                  : "-",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
        state.isLoading ? SizedBox(height: 8) : SizedBox(height: 4),
        state.isLoading
            ? CustomShimmer(child: CustomPlaceholder(height: 18, width: 50))
            : Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                state.residentHouse != null
                    ? state.residentHouse?.house.rt?.name ?? "-"
                    : "-",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
      ],
    );
  }

  Container _fitureItem({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onClick,
    required String content,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onClick,
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                ),
              ),
              Text(content, style: Theme.of(context).textTheme.headlineLarge),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector _menuItem(
    BuildContext context, {
    required title,
    required onTab,
    Color? color,
    IconData? icon,
  }) {
    return GestureDetector(
      onTap: onTab,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: 30, child: Icon(icon, color: color)),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
