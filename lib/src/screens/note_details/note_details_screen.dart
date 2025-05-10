import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/models/note_model/note_model.dart';

class NoteDetailsScreen extends StatelessWidget {
  final NoteModel note;

  const NoteDetailsScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(note.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0.h),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.file(
                File(note.imagePath),
                width: double.infinity,
                height: 250.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              note.title,
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              note.comment,
              style: TextStyle(fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
