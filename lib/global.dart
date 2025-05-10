



import 'package:dog_test/src/common/models/note_model/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(NoteModelAdapter());
    await Hive.openBox<NoteModel>('notes');

  }
}