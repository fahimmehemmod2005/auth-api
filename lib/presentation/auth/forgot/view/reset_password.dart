import 'package:auth/core/routes/route_manager.dart';
import 'package:auth/presentation/widgets/primary_button.dart';
import 'package:auth/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextInputField(mainLabel: 'Password', hintText: 'New password'),
              10.verticalSpace,
              TextInputField(
                mainLabel: 'Conrim Password',
                hintText: 'Re-enter your password',
              ),
              20.verticalSpace,
              PrimaryButton(
                label: 'set a new password',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.login);
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
