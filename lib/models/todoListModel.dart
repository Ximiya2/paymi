import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class TodoListModel {
  @HiveField(0)
  String image;
  @HiveField(1)
  String name;
  @HiveField(2)
  String nomer;
  @HiveField(3)
  String card;
  @HiveField(4)
  String date;

  TodoListModel({
    required this.image,
    required this.name,
    required this.nomer,
    required this.card,
    required this.date
});

}