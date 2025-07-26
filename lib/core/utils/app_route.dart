import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reco_genie_internship/core/utils/service_locator.dart';
import 'package:reco_genie_internship/features/auth/domain/use_case/login_use_case.dart';
import 'package:reco_genie_internship/features/auth/domain/use_case/register_use_case.dart';
import 'package:reco_genie_internship/features/auth/presentation/manger/auth_bloc.dart';
import 'package:reco_genie_internship/features/auth/presentation/views/login_view.dart';
import 'package:reco_genie_internship/features/auth/presentation/views/register_view.dart';
import 'package:reco_genie_internship/features/home/data/data_sorce/home_remote_data_source.dart';
import 'package:reco_genie_internship/features/home/data/repo/home_repo_impl.dart';
import 'package:reco_genie_internship/features/home/domain/use_case/fetch_menu_item.dart';
import 'package:reco_genie_internship/features/home/presentation/manger/home_bloc.dart';
import 'package:reco_genie_internship/features/home/presentation/manger/home_event.dart';
import 'package:reco_genie_internship/features/home/presentation/views/home_view.dart';
import 'package:reco_genie_internship/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static String splashView = '/';
  static String onBoardingView = '/onBoarding';
  static String registerView = '/register';
  static String loginView = '/login';
  static String homeView = '/home';
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
        builder: (context, state) => BlocProvider(
          create: (context) => HomeBloc(
            FetchMenuItemUseCase(HomeRepoImpl(HomeRemoteDataSourceImpl())),
          )..add(FetchMenuItem()),
          child: const HomeView(),
        ),
      ),
    ],
  );
}
