import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch<HomeState>(homeViewModelProvider);
    final notifier = ref.watch<HomeViewModel>(homeViewModelProvider.notifier);
    return Scaffold(appBar: AppBar(title: Text("Profile")));
  }
}
