import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class Food {
  @HiveField(0)
  int? id;


  @HiveField(1)
  String name;

  @HiveField(2)
  int? category;

  @HiveField(3)
  String cost;

  @HiveField(4)
  dynamic image;
@HiveField(5)
  dynamic description;



   Food({
     this.id,
    required this.name,
      this.category,
    required this.cost,
      this.image,
     required this.description



  });
}
