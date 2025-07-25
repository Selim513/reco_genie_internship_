import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:reco_genie_internship/core/enums/general_bloc_enum.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';
import 'package:reco_genie_internship/core/utils/app_route.dart';
import 'package:reco_genie_internship/core/widgets/custom_elevated_button.dart';
import 'package:reco_genie_internship/core/widgets/custom_snack_bar.dart';
import 'package:reco_genie_internship/features/auth/presentation/manger/auth_bloc.dart';
import 'package:reco_genie_internship/features/auth/presentation/manger/auth_event.dart';
import 'package:reco_genie_internship/features/auth/presentation/manger/auth_state.dart';
import 'package:reco_genie_internship/features/auth/presentation/views/widget/widgets/custom_auth_header.dart';
import 'package:reco_genie_internship/features/auth/presentation/views/widget/widgets/custom_auth_redirect_text.dart';
import 'package:reco_genie_internship/features/auth/presentation/views/widget/widgets/custom_terms_and_policy_section.dart';
import 'package:reco_genie_internship/features/auth/presentation/views/widget/widgets/register_form_labels.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController nameContoller = TextEditingController();
  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passwordContoller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 9.w),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeaderSection(
              title: 'Create an account',
              subTitle: 'Let’s create your account.',
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state.status == BlocStatus.success) {
                  CustomSnackBar.confrimEmailSnackBar(
                    state.succMessage!,
                    context,
                  );
                  context.goNamed(AppRouter.loginView);
                } else {
                  CustomSnackBar.errorSnackBar(state.errMessage!, context);
                }
              },
              builder: (context, state) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    spacing: 12.h,
                    children: [
                      AuthFormLabel(
                        isRegister: true,
                        emailController: emailContoller,
                        passwordController: passwordContoller,
                        nameController: nameContoller,
                      ),
                      const CustomTermsAndPrivacySection(),

                      CustomElevatedButton(
                        onPress: () async {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                              RegisterEvent(
                                name: nameContoller.text,
                                email: emailContoller.text,
                                password: passwordContoller.text,
                              ),
                            );
                          }
                        },
                        widget: state.status == BlocStatus.loading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                'Create an account',
                                style: AppFonts.mediumWhite16,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Spacer(),
            CustomAuthRedirectText(
              isLogin: true,
              onTap: () => context.goNamed(AppRouter.loginView),
            ),
          ],
        ),
      ),
    );
  }
}
