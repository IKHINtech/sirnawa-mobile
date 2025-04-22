import 'package:flutter/material.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class RtScreen extends StatefulWidget {
  const RtScreen({super.key});

  @override
  State<RtScreen> createState() => _RtScreenState();
}

class _RtScreenState extends State<RtScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: 'Data RT'));
  }
}
