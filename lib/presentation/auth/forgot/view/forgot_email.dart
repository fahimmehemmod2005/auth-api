import 'package:auth/core/routes/route_manager.dart';
import 'package:auth/presentation/widgets/primary_button.dart';
import 'package:auth/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotEmail extends StatefulWidget {
  const ForgotEmail({super.key});

  @override
  State<ForgotEmail> createState() => _ForgotEmailState();
}

class _ForgotEmailState extends State<ForgotEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextInputField(mainLabel: 'Email', hintText: 'Enter your email'),
              10.verticalSpace,
              PrimaryButton(
                label: 'Next',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.forgotOtp);
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
