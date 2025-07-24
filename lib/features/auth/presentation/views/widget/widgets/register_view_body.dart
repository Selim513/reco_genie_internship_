import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship_/core/utils/app_fonts.dart';
import 'package:reco_genie_internship_/core/widgets/custom_elevated_button.dart';
import 'package:reco_genie_internship_/features/auth/presentation/views/widget/widgets/custom_auth_header.dart';
import 'package:reco_genie_internship_/features/auth/presentation/views/widget/widgets/custom_auth_redirect_text.dart';
import 'package:reco_genie_internship_/features/auth/presentation/views/widget/widgets/custom_terms_and_policy_section.dart';
import 'package:reco_genie_internship_/features/auth/presentation/views/widget/widgets/register_form_labels.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 9.w),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeaderSection(
            title: 'Create an account',
            subTitle: 'Let’s create your account.',
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              spacing: 12.h,
              children: [
                const RegistrationFormLabels(),
                const CustomTermsAndPrivacySection(),
                CustomElevatedButton(
                  onPress: () {},
                  widget: Text(
                    'Create an account',
                    style: AppFonts.mediumWhite16,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          CustomAuthRedirectText(),
        ],
      ),
    );
  }
}
