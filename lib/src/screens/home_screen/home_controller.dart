import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/models/note_model/note_model.dart';

class HomeScreenController extends GetxController {
  var notes = <NoteModel>[].obs;
  late Box<NoteModel> noteBox;

  final titleController = TextEditingController();
  final commentController = TextEditingController();
  final RxString imagePath = ''.obs;

  final picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    noteBox = Hive.box<NoteModel>('notes');
    loadNotes();
  }

  void loadNotes() {
    notes.value = noteBox.values.toList();
  }

  void addNote(NoteModel note) async {
    await noteBox.add(note);
    loadNotes();
  }

  void pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    }
  }

  void saveNote() {
    if (titleController.text.isNotEmpty && imagePath.value.isNotEmpty) {
      final note = NoteModel(
        title: titleController.text,
        comment: commentController.text,
        imagePath: imagePath.value,
      );
      addNote(note);
      titleController.clear();
      commentController.clear();
      imagePath.value = '';
    } else {
      Get.snackbar("Error", "Title and Image are required");
    }
  }

  // Load notes from local storage (Hive)
  void _loadNotes() async {
    noteBox = await Hive.openBox<NoteModel>('notesBox');
    notes.value = noteBox.values.toList();
  }

  // Delete a note from the list and local storage
  void deleteNote(int index) {
    // Remove from local storage
    noteBox.deleteAt(index);

    // Remove from list (update UI)
    notes.removeAt(index);

    // Optionally, show a message to the user
    Get.snackbar("Deleted", "Note deleted successfully");
  }

  // You can also add methods to update notes, like in your edit function
  void editNote({required int index, required NoteModel updatedNote}) {
    // Update in local storage
    noteBox.putAt(index, updatedNote);

    // Update in list (update UI)
    notes[index] = updatedNote;

    // Optionally, show a message to the user
    Get.snackbar("Updated", "Note updated successfully");
  }
}
