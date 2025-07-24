import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship_/features/auth/presentation/views/widget/widgets/custom_auth_text_form.dart';

class RegistrationFormLabels extends StatelessWidget {
  const RegistrationFormLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAuthTextFormField(
          title: 'Full name',
          controller: TextEditingController(),
          hinttText: 'Enter your name',
          dynamicSuffixIcon: true,
        ),
        CustomAuthTextFormField(
          title: 'Email',
          controller: TextEditingController(),
          hinttText: 'Enter your email address',
          dynamicSuffixIcon: true,
        ),
        CustomAuthTextFormField(
          title: 'Password',
          controller: TextEditingController(),
          hinttText: 'Enter your Password',
          dynamicSuffixIcon: true,
        ),
      ],
    );
  }
}
