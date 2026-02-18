import 'package:auth/core/routes/route_manager.dart';
import 'package:auth/presentation/widgets/primary_button.dart';
import 'package:auth/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data'),),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextInputField(mainLabel: 'Email', hintText: 'Enter your email'),
              10.verticalSpace,
              TextInputField(
                mainLabel: 'Password',
                hintText: 'Enter your Password',
                suffixIcon: Icons.visibility_off_outlined,
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
                label: 'Login',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.home);
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
