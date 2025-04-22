import 'package:flutter/material.dart';

class WarungScreen extends StatefulWidget {
  const WarungScreen({super.key});

  @override
  State<WarungScreen> createState() => _WarungScreenState();
}

class _WarungScreenState extends State<WarungScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Warung")));
  }
}
