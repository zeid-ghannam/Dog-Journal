import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/models/note_model/note_model.dart';

class NotWidget extends StatelessWidget {
  final NoteModel note;

  final VoidCallback onDelete;
  final void Function()? onView;
  final void Function()? onEdit; // Add this to accept the edit function

  const NotWidget({
    super.key,
    required this.note,
    required this.onDelete,
    this.onView,
    this.onEdit, // Initialize edit function here
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onView, // Navigate to details screen or perform onView action
      child: ListTile(
        // Tap on list tile to edit
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            File(note.imagePath),
            width: 50.w,
            height: 50.w,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(note.title),
        subtitle: Text(
          note.comment,
          maxLines: 1,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit), // Edit icon
              onPressed: onEdit, // Trigger edit action
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete, // Delete the note
            ),
          ],
        ),
      ),
    );
  }
}
