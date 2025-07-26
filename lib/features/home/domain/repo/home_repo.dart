import 'package:reco_genie_internship/features/home/data/models/item_model.dart';

abstract class HomeRepo {
  Future<List<ItemModel>> fetchMenuItems();
}
