import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class Food {
  @HiveField(0)
  String name;

  @HiveField(1)
  String? category;

  @HiveField(2)
  String cost;

  @HiveField(3)
  dynamic image;
  @HiveField(4)
  dynamic description;

  Food(
      {required this.name,
      required this.category,
      required this.cost,
      this.image,
      required this.description});
}
