import 'package:reco_genie_internship/features/home/data/data_sorce/home_remote_data_source.dart';
import 'package:reco_genie_internship/features/home/data/models/item_model.dart';
import 'package:reco_genie_internship/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource data;
  @override

  HomeRepoImpl(this.data);

  @override
  Future<List<ItemModel>> fetchMenuItems() async {
    try {
      final itemList = await data.fetchMenuItems();
      return itemList;
    } catch (e) {
      throw Exception('Error $e');
    }
  }
}
