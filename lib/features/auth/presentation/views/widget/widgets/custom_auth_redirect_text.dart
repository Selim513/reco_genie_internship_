
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';
import 'package:reco_genie_internship/features/auth/presentation/views/login_view.dart';

class CustomAuthRedirectText extends StatelessWidget {
  const CustomAuthRedirectText({
    super.key,
  });

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
            TextSpan(text: 'Already Have an account? '),
            TextSpan(
              text: 'Login',
              style: AppFonts.regularBoldBlack14.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 1.5,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
