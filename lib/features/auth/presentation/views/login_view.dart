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
import 'package:reco_genie_internship/features/auth/presentation/views/widget/widgets/register_form_labels.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // final TextEditingController nameContoller = TextEditingController();
  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passwordContoller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 9.w),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status == BlocStatus.success) {
              CustomSnackBar.successSnackBar(state.succMessage!, context);
              context.goNamed(AppRouter.homeView);
            } else if (state.status == BlocStatus.fail) {
              print(state.errMessage);
              CustomSnackBar.errorSnackBar(state.errMessage!, context);
            }
          },
          builder: (context, state) => Form(
            key: formKey,
            child: Column(
              spacing: 16.h,
              children: [
                AuthHeaderSection(
                  title: 'Create an account',
                  subTitle: 'Let’s create your account.',
                ),
                AuthFormLabel(
                  isRegister: false,
                  emailController: emailContoller,
                  passwordController: passwordContoller,
                ),
                CustomElevatedButton(
                  widget: state.status == BlocStatus.loading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Login', style: AppFonts.mediumWhite16),
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                        LoginEvent(
                          email: emailContoller.text,
                          password: passwordContoller.text,
                        ),
                      );
                    }
                  },
                ),
                CustomAuthRedirectText(isLogin: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
