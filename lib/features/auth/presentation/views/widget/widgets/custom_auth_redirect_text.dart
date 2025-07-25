import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';

class CustomAuthRedirectText extends StatelessWidget {
  const CustomAuthRedirectText({super.key, this.onTap, required this.isLogin});
  final bool isLogin;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: AppFonts.semiBoldGrey32.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
          ),
          children: [
            TextSpan(
              text: isLogin
                  ? 'Already Have an account? '
                  : 'Dont have an account',
            ),
            TextSpan(
              text: isLogin ? 'Login' : 'Join',
              style: AppFonts.regularBoldBlack14.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 1.5,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
