import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_elevated_button.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(loginViewModelProvider, (previous, next) {
      if (next.error != null && next.error != previous?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
            content: Text(next.error!),
            backgroundColor: Theme.of(context).colorScheme.error,
            action: SnackBarAction(
              label: 'Close',
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        );
      }
    });
    final state = ref.watch(loginViewModelProvider);
    final viewModel = ref.read(loginViewModelProvider.notifier);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Theme.of(context).colorScheme.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildLogo(context),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CustomTextField(
                        controller: emailController,
                        value: emailController.text,
                        labelText: 'Email',
                        require: true,
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CustomTextField(
                        controller: passwordController,
                        isPassword: _obscureText,
                        value: passwordController.text,
                        labelText: 'Password',
                        maxLength: 1,
                        maxLines: 1,
                        require: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon:
                              _obscureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomElevatedButton(
                      title: state.loginStatus.when(
                        data: (_) => "Login",
                        error: (_, __) => "Login",
                        loading: () => null,
                      ),
                      onPressed: state.loginStatus.when(
                        data:
                            (_) => () {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  _formKey.currentState!.save();
                                  viewModel.login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Opps: ${e.toString()}'),
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                }
                              }
                            },
                        error: (_, __) => () {},
                        loading: () => () {},
                      ),
                      child: state.loginStatus.when(
                        data: (_) => null,
                        error: (_, __) => null,
                        loading:
                            () => const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            ),
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

  Widget _buildLogo(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
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
        'Akun belum aktif ? Aktifkan akun di sini',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
