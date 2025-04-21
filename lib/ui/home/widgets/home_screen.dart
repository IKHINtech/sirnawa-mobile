import 'package:flutter/material.dart';
import 'package:sirnawa_mobile/ui/core/themes/dimens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _email = TextEditingController(
    text: 'email@example.com',
  );
  final TextEditingController _password = TextEditingController(
    text: 'password',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: Dimens.of(context).edgeInsetsScreenSymmetric,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(controller: _email),
                const SizedBox(height: Dimens.paddingVertical),
                TextField(controller: _password, obscureText: true),
                const SizedBox(height: Dimens.paddingVertical),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
