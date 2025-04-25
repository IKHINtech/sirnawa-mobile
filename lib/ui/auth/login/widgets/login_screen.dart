import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_elevated_button.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_text_field.dart';

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
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: emailController,
                    value: emailController.text,
                    labelText: 'Email',
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: passwordController,
                    isPassword: true,
                    value: passwordController.text,
                    labelText: 'Password',
                    maxLength: 1,
                    maxLines: 1,
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
                        (_) => CustomElevatedButton(
                          title: "Login",
                          onPressed: () {
                            viewModel.login(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
