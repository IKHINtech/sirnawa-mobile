import 'package:flutter/material.dart';
import 'package:sirnawa_mobile/ui/admin/rt/rt_viewmodel/rt_viewmodel.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class RtScreen extends StatefulWidget {
  const RtScreen({super.key, required this.viewModel});
  final RtViewModel viewModel;
  @override
  State<RtScreen> createState() => _RtScreenState();
}

class _RtScreenState extends State<RtScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    widget.viewModel.fetchListRt(reset: true); // load pertama
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      widget.viewModel.loadMore(); // panggil loadMore saat dekat bawah
    }
  }

  void _onViewModelChange() {
    setState(
      () {},
    ); // ini yang trigger rebuild ketika notifyListeners() dipanggil
  }

  @override
  void dispose() {
    _scrollController.dispose();
    widget.viewModel.removeListener(_onViewModelChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;
    return Scaffold(
      appBar: CustomAppBar(title: 'Data RT'),
      body:
          vm.isLoading && vm.list.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : vm.error != null
              ? Center(child: Text("Error: ${vm.error}"))
              : RefreshIndicator(
                onRefresh: () => vm.fetchListRt(reset: true),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount:
                      vm.hasNextPage ? vm.list.length + 1 : vm.list.length,
                  itemBuilder: (context, index) {
                    if (index >= vm.list.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final rt = vm.list[index];
                    return ListTile(
                      title: Text(rt.name),
                      subtitle: Text("ID: ${rt.id}"),
                    );
                  },
                ),
              ),
    );
  }
}
