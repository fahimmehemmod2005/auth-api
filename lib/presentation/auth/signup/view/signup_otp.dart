import 'package:auth/core/routes/route_manager.dart';
import 'package:auth/presentation/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class SignupOtp extends StatefulWidget {
  const SignupOtp({super.key});

  @override
  State<SignupOtp> createState() => _SignupOtpState();
}

class _SignupOtpState extends State<SignupOtp> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      height: 70.0.h,
      width: 75.0.w,
      textStyle: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        color: CupertinoColors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.0.r),
        border: Border.all(color: CupertinoColors.black),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.0.r),
        border: Border.all(color: CupertinoColors.systemBlue),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0.r),
        border: Border.all(color: CupertinoColors.systemRed),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.verticalSpace,
              Text("abcd@example.com"),
              30.verticalSpace,

              Pinput(
                keyboardType: TextInputType.number,
                length: 4,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                errorPinTheme: errorPinTheme,
              ),
              20.verticalSpace,

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't receive the code? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "resend code",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),

              20.verticalSpace,

              PrimaryButton(
                label: 'Submit',
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
