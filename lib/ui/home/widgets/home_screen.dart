import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});
  final HomeViewmodel viewModel;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  late final HomeViewmodel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel;
    _viewModel.addListener(_onModelChanged);
  }

  void _onModelChanged() => setState(() {});

  @override
  void dispose() {
    _viewModel.removeListener(_onModelChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<HomeViewmodel>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                Text(
                  "Sirnajaya Kartika",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.apartment_rounded,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      viewmodel.user?.resident?.name ?? "-",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      viewmodel.user?.role.toUpperCase() ?? "-",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "Blok I - 1 No.29",
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 30,
                      child: const Icon(LucideIcons.user, color: Colors.white),
                    ),
                  ],
                ),
                  ],
                ),
              ),
              
              Container(height: 20, color: Colors.white,),
              Center(
                child: Text(
                  "Menu",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(LucideIcons.receipt),
                      ),
                      Text(
                        "IPL",
                        style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(
                          LucideIcons.annoyed,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        "Info",
                        style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(LucideIcons.info, color: Colors.green),
                      ),
                      Text(
                        "Ronda",
                        style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(
                          LucideIcons.settings,
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        "Admin",
                        style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Container(height: 20, color: Colors.white,),
              Text(
                "Fitur",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              GridView.count(
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text("He'd have you all unravel at the"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[200],
                    child: const Text('Heed not the rabble'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[300],
                    child: const Text('Sound of screams but the'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[400],
                    child: const Text('Who scream'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[500],
                    child: const Text('Revolution is coming...'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[600],
                    child: const Text('Revolution, they...'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(LucideIcons.home), label: 'Home'),
          NavigationDestination(
            icon: Badge(child: Icon(LucideIcons.users)),
            label: 'Community',
          ),
          NavigationDestination(
            icon: Badge(label: Text('2'), child: Icon(Icons.shopping_bag)),
            label: 'Warung',
          ),

          NavigationDestination(icon: Icon(LucideIcons.user), label: 'Profile'),
        ],
      ),
    );
  }
}
