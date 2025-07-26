import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 10.h),
      child: SearchBar(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10.w),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        hintStyle: WidgetStatePropertyAll(
          AppFonts.semiBoldGrey32.copyWith(fontSize: 18.sp),
        ),
        leading: Icon(Icons.search, color: Colors.grey),
        hintText: 'Search',
      ),
    );
  }
}
