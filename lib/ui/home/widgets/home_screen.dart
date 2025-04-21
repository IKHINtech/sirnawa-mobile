import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).colorScheme.primary)),
                  Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Irfan Hadi"),
                          Text("Blok I - 1 No.29"),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
          ],
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

          NavigationDestination(
            icon: Icon(LucideIcons.user) , 
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
