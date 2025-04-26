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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Theme.of(context).colorScheme.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildLogo(),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CustomTextField(
                        controller: emailController,
                        value: emailController.text,
                        labelText: 'Email',
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CustomTextField(
                        controller: passwordController,
                        isPassword: true,
                        value: passwordController.text,
                        labelText: 'Password',
                        maxLength: 1,
                        maxLines: 1,
                        suffixIcon: Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 20),
                    _buildSignUpText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/sirnawa-logo.png',
          ), // Ganti dengan logo aplikasi Anda
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpText() {
    return GestureDetector(
      onTap: () {
        // Arahkan ke screen signup
      },
      child: Text(
        'Belum punya akun? Daftar sekarang!',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
