import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_internship/core/enums/general_bloc_enum.dart';
import 'package:reco_genie_internship/features/home/domain/use_case/fetch_menu_item.dart';
import 'package:reco_genie_internship/features/home/presentation/manger/home_event.dart';
import 'package:reco_genie_internship/features/home/presentation/manger/home_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final FetchMenuItemUseCase items;
  HomeBloc(this.items) : super(HomeBlocState()) {
    on<HomeBlocEvent>((event, emit) async {
      if (event is FetchMenuItem) {
        try {
          emit(state.copyWith(status: BlocStatus.loading));
          final data = await items.call();
          emit(state.copyWith(status: BlocStatus.success, itemsList: data));
        } catch (e) {
          print(e);
          emit(state.copyWith(status: BlocStatus.fail));
        }
      }
    });
  }
}
