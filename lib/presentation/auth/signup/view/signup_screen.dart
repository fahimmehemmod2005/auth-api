import 'package:auth/core/routes/route_manager.dart';
import 'package:auth/presentation/widgets/primary_button.dart';
import 'package:auth/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.camera_alt_outlined),
                  ),
                ),
              ),
              10.verticalSpace,
              Text(
                'Set a image',
              ),
              10.verticalSpace,
              TextInputField(mainLabel: 'Name', hintText: 'Enter your name'),
              10.verticalSpace,
              TextInputField(mainLabel: 'Email', hintText: 'Enter your email'),
              10.verticalSpace,
              TextInputField(
                mainLabel: 'Password',
                hintText: 'Enter your password',
                suffixIcon: Icons.visibility_off_outlined,
              ),
              10.verticalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.login);
                },
                child: Text(
                  'Already have an account',
                ),
              ),
              20.verticalSpace,
              PrimaryButton(
                label: 'Signup',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signupOtp);
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
