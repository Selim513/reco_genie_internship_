import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_internship/core/enums/general_bloc_enum.dart';
import 'package:reco_genie_internship/features/auth/domain/use_case/login_use_case.dart';
import 'package:reco_genie_internship/features/auth/domain/use_case/register_use_case.dart';
import 'package:reco_genie_internship/features/auth/presentation/manger/auth_event.dart';
import 'package:reco_genie_internship/features/auth/presentation/manger/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase register;
  final LoginUseCase login;
  AuthBloc(this.register, this.login) : super(AuthState()) {
    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(status: BlocStatus.loading));
      try {
        await register.call(
          email: event.email,
          password: event.password,
          name: event.name,
        );
        emit(
          state.copyWith(
            status: BlocStatus.success,
            succMessage: 'Registeration success',
          ),
        );
      } catch (e) {
        print(e);
        emit(
          state.copyWith(
            status: BlocStatus.fail,
            errMessage: '--${e.toString()}',
          ),
        );
      }
    });
  }
}
