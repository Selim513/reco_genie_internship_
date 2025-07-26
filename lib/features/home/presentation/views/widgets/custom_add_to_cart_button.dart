import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';

class CustomAddToCartButton extends StatelessWidget {
  const CustomAddToCartButton({
    super.key,
    required this.title,
    required this.onPress,
  });
  final String title;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
            borderRadius: BorderRadiusGeometry.circular(20.w),
          ),
        ),
        onPressed: onPress,
        child: Text(
          title,
          style: AppFonts.mediumWhite16.copyWith(color: Colors.blue),
        ),
      ),
    );
  }
}
