import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_fonts.dart';

class CusotmMenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CusotmMenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.only(right: 10.w),
      title: Text(
        'Menu',
        style: AppFonts.semiBoldBlack32.copyWith(
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Icon(Icons.notifications_none_outlined, size: 25.h),
        Gap(5.w),
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: Center(child: Text('JD', style: AppFonts.boldWhite16)),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
