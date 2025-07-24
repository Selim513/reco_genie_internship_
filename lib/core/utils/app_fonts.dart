import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppFonts {
  static final TextStyle semiBoldBlack32 = TextStyle(
    color: Colors.black,
    fontSize: 32.sp,
    fontWeight: FontWeight.w900,
  );
  static final TextStyle regularBoldBlack14 = TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle mediumWhite16 = TextStyle(
    color: Colors.white,

    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle boldWhite16 = TextStyle(
    color: Colors.white,

    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle semiBoldGrey32 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w900,
    color: const Color(0xff808080),
  );
}
