import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputField extends StatelessWidget {
  final String? hintText;
  final String? mainLabel;
  final int? maxLines;
  final int? minLines;
  final bool obscureText;
  final IconData? suffixIcon;
  final double? borderRadius;
  final Color? fillColor;
  final TextEditingController? controller;
  final String? errorText;
  final void Function()? suffixIconTap;
  const TextInputField({
    super.key,
    this.hintText,
    this.maxLines = 1,
    this.minLines = 1,
    this.obscureText = false,
    this.suffixIcon,
    this.mainLabel,
    this.borderRadius,
    this.fillColor,
    this.controller,
    this.errorText,
    this.suffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (mainLabel != null)
          Text(
            mainLabel!,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
        5.verticalSpace,
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          minLines: maxLines,
          obscureText: obscureText,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: suffixIconTap,
                child: Icon(suffixIcon)),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              borderSide: BorderSide(color: CupertinoColors.systemBlue),
            ),
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}
