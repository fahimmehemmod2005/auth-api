import 'package:auth/core/routes/route_manager.dart';
import 'package:auth/presentation/auth/login/viewmodel/login_provider.dart';
import 'package:auth/presentation/widgets/primary_button.dart';
import 'package:auth/presentation/widgets/text_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/utils/utils.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool _validateForm() {
    final isValid = ref
        .read(loginProvider.notifier)
        .validation(email: _email.text.trim(), password: _password.text.trim());
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    final authNotifier = ref.read(loginProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextInputField(
                mainLabel: 'Email',
                hintText: 'Enter your email',
                controller: _email,
                errorText: state.emailError,
              ),
              10.verticalSpace,
              TextInputField(
                mainLabel: 'Password',
                hintText: 'Enter your Password',
                controller: _password,
                errorText: state.passError,
                suffixIcon: ref.read(loginProvider).isPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                obscureText: ref.read(loginProvider).isPasswordVisible,
                suffixIconTap: () => authNotifier.isPasswordVisible(),
              ),
              10.verticalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.signup);
                },
                child: Text('Create account'),
              ),
              10.verticalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.forotEmail);
                },
                child: Text('Forgot Password'),
              ),

              30.verticalSpace,
              PrimaryButton(
                label: state.isLoading ? 'Loading...' : 'Login',
                onPressed: state.isLoading
                    ? () {}
                    : () async {
                        final isValid = _validateForm();
                        if (isValid) {
                          final res = await authNotifier.login(
                            email: _email.text.trim(),
                            password: _password.text.trim(),
                          );
                          if (res.isSuccess) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.home,
                              (route) => false,
                            );
                          } else {
                            Utils.showToast(
                              message: res.message,
                              backgroundColor: CupertinoColors.systemRed,
                              textColor: CupertinoColors.black,
                            );
                          }
                        }
                      },
              ),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

/*
email: bomah23791@hlkes.com
password: 12345678
*/
