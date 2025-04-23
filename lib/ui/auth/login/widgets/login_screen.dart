import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);
    final viewModel = ref.read(loginViewModelProvider.notifier);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            state.loginStatus.when(
              loading: () => const CircularProgressIndicator(),
              error:
                  (error, stack) => Text(
                    'Error: ${error.toString()}',
                    style: const TextStyle(color: Colors.red),
                  ),
              data:
                  (_) => ElevatedButton(
                    onPressed: () {
                      viewModel.login(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                    child: const Text('Login'),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
