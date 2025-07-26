class ItemModel {
  final String title;
  final String desc;
  final num price;
  final String imageUrl;

  ItemModel({
    required this.title,
    required this.desc,
    required this.price,
    required this.imageUrl,
  });
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      title: json['title'] ?? '',
      price: json['price'] ?? 0,

      desc: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }
}
