import 'package:reco_genie_internship/features/home/data/models/item_model.dart';
import 'package:reco_genie_internship/features/home/domain/repo/home_repo.dart';

class FetchMenuItemUseCase {
  final HomeRepo homeRepo;

  FetchMenuItemUseCase(this.homeRepo);

  Future<List<ItemModel>> call() {
    return homeRepo.fetchMenuItems();
  }
}
