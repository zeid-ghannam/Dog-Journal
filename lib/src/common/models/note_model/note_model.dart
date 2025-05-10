import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String comment;

  @HiveField(2)
  String imagePath;

  NoteModel({required this.title, required this.comment, required this.imagePath});
}
