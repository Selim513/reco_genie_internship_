import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reco_genie_internship/features/home/data/models/item_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ItemModel>> fetchMenuItems();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final fireStore = FirebaseFirestore.instance;
  @override
  Future<List<ItemModel>> fetchMenuItems() async {
    var snapshot = await fireStore.collection('Menu').get();
  
    List<ItemModel> itemList = snapshot.docs
        .map((doc) => ItemModel.fromJson(doc.data()))
        .toList();
    return itemList;
  }
}
