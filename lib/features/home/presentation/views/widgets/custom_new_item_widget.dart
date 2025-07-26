
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';

class CustomNewItemWidget extends StatelessWidget {
  const CustomNewItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepOrange,
      ),
      child: Text(
        'New',
        style: AppFonts.regularBoldBlack14.copyWith(
          color: Colors.white,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
