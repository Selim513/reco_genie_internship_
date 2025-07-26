import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reco_genie_internship/core/utils/service_locator.dart';
import 'package:reco_genie_internship/features/auth/domain/use_case/login_use_case.dart';
import 'package:reco_genie_internship/features/auth/domain/use_case/register_use_case.dart';
import 'package:reco_genie_internship/features/auth/presentation/manger/auth_bloc.dart';
import 'package:reco_genie_internship/features/auth/presentation/views/login_view.dart';
import 'package:reco_genie_internship/features/auth/presentation/views/register_view.dart';
import 'package:reco_genie_internship/features/cart/presentation/views/cart_view.dart';
import 'package:reco_genie_internship/features/home/presentation/views/home_layout.dart';
import 'package:reco_genie_internship/features/home/presentation/views/home_view.dart';
import 'package:reco_genie_internship/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static String splashView = '/';
  static String onBoardingView = '/onBoarding';
  static String registerView = '/register';
  static String loginView = '/login';
  static String homeView = '/home';
  static String cartView = '/cart';
  static String layOutView = '/layOut';
  static final router = GoRouter(
    routes: [
      GoRoute(
        name: splashView,
        path: splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: registerView,
        path: registerView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              AuthBloc(getIt.get<RegisterUseCase>(), getIt.get<LoginUseCase>()),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        name: loginView,
        path: loginView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              AuthBloc(getIt.get<RegisterUseCase>(), getIt.get<LoginUseCase>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        name: homeView,
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        name: cartView,
        path: cartView,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        name: layOutView,
        path: layOutView,
        builder: (context, state) => const HomeLayout(),
      ),
    ],
  );
}
