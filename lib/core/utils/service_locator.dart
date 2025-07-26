import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:reco_genie_internship/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:reco_genie_internship/features/auth/data/repo/auth_repo_impl.dart';
import 'package:reco_genie_internship/features/auth/domain/repo/auth_repo.dart';
import 'package:reco_genie_internship/features/auth/domain/use_case/login_use_case.dart';
import 'package:reco_genie_internship/features/auth/domain/use_case/register_use_case.dart';
import 'package:reco_genie_internship/features/home/data/data_sorce/home_remote_data_source.dart';
import 'package:reco_genie_internship/features/home/data/repo/home_repo_impl.dart';
import 'package:reco_genie_internship/features/home/domain/repo/home_repo.dart';
import 'package:reco_genie_internship/features/home/domain/use_case/fetch_menu_item.dart';

final GetIt getIt = GetIt.instance;
void serviceLocator() {
  //---------------------------Firebase Instance--------------------------
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  //------------BLocAuth-------------------------------------
  //-AuthRemoteDataSource
  getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());
  //-AuthRepo
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(getIt.get<AuthRemoteDataSource>()),
  );
  //-RegitserUseCase
  getIt.registerSingleton<RegisterUseCase>(
    RegisterUseCase(getIt.get<AuthRepo>()),
  );
  //-LoginUseCase
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt.get<AuthRepo>()));
  //-----------------------------------------------------------------------------------//
  //------------HomeBloc------
  getIt.registerSingleton<HomeRemoteDataSource>(HomeRemoteDataSourceImpl());
  //-
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(getIt.get<HomeRemoteDataSource>()),
  );
  //-
  getIt.registerSingleton<FetchMenuItemUseCase>(
    FetchMenuItemUseCase(getIt.get<HomeRepo>()),
  );
}
