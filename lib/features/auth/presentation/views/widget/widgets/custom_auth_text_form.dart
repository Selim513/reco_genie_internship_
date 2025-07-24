
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:reco_genie_internship_/core/utils/app_colors.dart';
import 'package:reco_genie_internship_/core/utils/app_fonts.dart';
import 'package:reco_genie_internship_/core/utils/text_form_decoration.dart';


class CustomAuthTextFormField extends StatefulWidget {
  const CustomAuthTextFormField({
    super.key,
    this.onChanged,
    this.suffixIcon,
    required this.hinttText,
    this.validator,
    this.controller,
    this.obsecure,
    required this.dynamicSuffixIcon,
    // required this.fieldType,
    this.isLogin,
    required this.title,
  });
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String hinttText;
  final bool? obsecure;
  final bool dynamicSuffixIcon;
  // final String fieldType;
  final bool? isLogin;
  final String title;

  @override
  State<CustomAuthTextFormField> createState() =>
      _CustomAuthTextFormFieldState();
}

class _CustomAuthTextFormFieldState extends State<CustomAuthTextFormField> {
  bool check = false;
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppFonts.mediumWhite16.copyWith(color: Colors.black),
        ),
        Gap(4.h),
        TextFormField(
          obscureText: widget.obsecure ?? false,
          controller: widget.controller,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          decoration: InputDecoration(
            focusedBorder: customOutLineBorders(
              color: isValid ? Colors.green : Colors.red,
            ),
            enabledBorder: customOutLineBorders(color: const Color(0xffE6E6E6)),
            focusedErrorBorder: customOutLineBorders(color: Colors.red),
            errorBorder: customOutLineBorders(color: Colors.red),
            hintText: widget.hinttText,
            hintStyle: AppFonts.mediumWhite16.copyWith(
              color: AppColors.greyColor,
            ),
            suffixIcon:
                widget.dynamicSuffixIcon && widget.controller!.text.isEmpty
                ? widget.suffixIcon
                : (check
                      ? isValid
                            ? const Icon(
                                Icons.check_circle_outline,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.error_outline_outlined,
                                color: Colors.red,
                              )
                      : null),
          ),
        ),
      ],
    );
  }
}
