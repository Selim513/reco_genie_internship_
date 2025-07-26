import 'package:equatable/equatable.dart';
import 'package:reco_genie_internship/core/enums/general_bloc_enum.dart';
import 'package:reco_genie_internship/features/home/data/models/item_model.dart';

class HomeBlocState extends Equatable {
  final BlocStatus status;
  final List<ItemModel>? itemsList;

  const HomeBlocState({
    this.status = BlocStatus.initial,
     this.itemsList,
  });
  HomeBlocState copyWith({BlocStatus? status, List<ItemModel>? itemsList}) {
    return HomeBlocState(
      status: status ?? this.status,
      itemsList: itemsList ?? this.itemsList,
    );
  }

  @override
  List<Object?> get props => [status,itemsList];
}
