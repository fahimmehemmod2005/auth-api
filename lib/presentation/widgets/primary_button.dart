import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color borderColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? fontSize;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = CupertinoColors.systemBlue,
    this.borderColor = CupertinoColors.transparent, 
    this.borderRadius,
     this.height, 
     this.width, this.fontSize, 
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(width ?? double.infinity, height ?? 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          side: BorderSide(color: borderColor,width: 1)
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: CupertinoColors.white,
          fontSize: fontSize ?? 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
