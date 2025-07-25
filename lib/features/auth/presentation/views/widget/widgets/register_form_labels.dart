import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_genie_internship/core/utils/validator.dart';
import 'package:reco_genie_internship/features/auth/presentation/views/widget/widgets/custom_auth_text_form.dart';

class AuthFormLabel extends StatelessWidget {
  const AuthFormLabel({
    super.key,
    this.nameController,
    required this.emailController,
    required this.passwordController,
    this.isRegister = false,
  });
  final bool isRegister;
  final TextEditingController? nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isRegister
            ? CustomAuthTextFormField(
                validator: (value) => checkNameValidator(value),
                title: 'Full name',
                controller: nameController,
                hinttText: 'Enter your name',
                dynamicSuffixIcon: true,
              )
            : Container(),
        CustomAuthTextFormField(
          validator: (value) => checkEmailValidator(value),
          title: 'Email',
          controller: emailController,
          hinttText: 'Enter your email address',
          dynamicSuffixIcon: true,
        ),
        CustomAuthTextFormField(
          validator: (value) => checkPasswordValidator(value),
          title: 'Password',
          controller: passwordController,
          hinttText: 'Enter your Password',
          dynamicSuffixIcon: true,
        ),
      ],
    );
  }
}
