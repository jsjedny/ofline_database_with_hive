import 'package:hive/hive.dart';

part 'home_data_model.g.dart';

@HiveType(typeId: 0)
class Post extends HiveObject {
  @HiveField(0)
  final num id;
  @HiveField(1)
  final String titile;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final num price;
  @HiveField(4)
  final String imgUrl;
  @HiveField(5)
  final String category;

  Post({
    required this.id,
    required this.titile,
    required this.description,
    required this.price,
    required this.category,
    required this.imgUrl,
  });

  factory Post.formJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      titile: json['title'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
      imgUrl: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': titile,
    'description': description,
    'price': price,
    'image': imgUrl,
    'category': category,
  };
}
