import 'package:equatable/equatable.dart';
import 'package:reco_genie_internship/features/home/data/models/item_model.dart';

abstract class HomeBlocEvent extends Equatable {}

class FetchMenuItem extends HomeBlocEvent {
  final List<ItemModel> itemList;

  FetchMenuItem({required this.itemList});
  @override
  // TODO: implement props
  List<Object?> get props => [itemList];
}
