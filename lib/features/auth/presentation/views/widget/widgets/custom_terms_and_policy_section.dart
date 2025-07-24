
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';

class CustomTermsAndPrivacySection extends StatelessWidget {
  const CustomTermsAndPrivacySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppFonts.mediumWhite16.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        children: [
          const TextSpan(text: 'By continuing, you agree to our '),
          TextSpan(
            text: 'Terms',
            style: AppFonts.regularBoldBlack14.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: Colors.black,
              decorationThickness: 1.5,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // فتح صفحة الشروط
              },
          ),
          const TextSpan(text: ', '),
          TextSpan(
            text: 'Privacy Policy',
            style: AppFonts.regularBoldBlack14.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: Colors.black,
              decorationThickness: 1.5,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // فتح صفحة الخصوصية
              },
          ),
          const TextSpan(text: ','),
          const TextSpan(text: ' and '),
          TextSpan(
            text: ' Cookie Use',
            style: AppFonts.regularBoldBlack14.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: Colors.black,
              decorationThickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
