
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship/core/utils/app_colors.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';


class AuthHeaderSection extends StatelessWidget {
  const AuthHeaderSection({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppFonts.semiBoldBlack32),
        Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Text(
            subTitle,
            style: AppFonts.mediumWhite16.copyWith(color: AppColors.greyColor),
          ),
        ),
      ],
    );
  }
}
