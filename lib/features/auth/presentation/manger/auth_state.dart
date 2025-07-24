import 'package:equatable/equatable.dart';
import 'package:reco_genie_internship/core/enums/general_bloc_enum.dart';

class AuthState extends Equatable {
  final BlocStatus status;
  final String? succMessage;
  final String? errMessage;

  const AuthState({
    this.status = BlocStatus.initial,
    this.succMessage,
    this.errMessage,
  });
  AuthState copyWith({
    BlocStatus? status,
    String? errMessage,
    String? succMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      errMessage: errMessage ?? this.errMessage,
      succMessage: succMessage ?? this.succMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, errMessage, succMessage];
}
