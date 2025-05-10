import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/models/note_model/note_model.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/labeled_text_field.dart';
import '../../common/widgets/not_widget.dart';
import '../note_details/note_details_screen.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  void showEditDialog(BuildContext context, int index, NoteModel note) {
    final titleController = TextEditingController(text: note.title);
    final commentController = TextEditingController(text: note.comment);

    Get.defaultDialog(
      title: "Edit Note",
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: commentController,
              decoration: const InputDecoration(labelText: "Comment"),
            ),
          ],
        ),
      ),
      textConfirm: "Save",
      textCancel: "Cancel",
      onConfirm: () {
        final updatedNote = NoteModel(
          title: titleController.text,
          comment: commentController.text,
          imagePath: note.imagePath, // same image
        );
        controller.editNote(index: index, updatedNote: updatedNote);
        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dog Journal")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LabeledTextField(
              controller: controller.titleController,
              label: "Title",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.h),
            child: LabeledTextField(
              controller: controller.commentController,
              label: "Comment",
            ),
          ),
          Obx(() {
            if (controller.imagePath.value.isEmpty) {
              return const Text("No image selected");
            } else {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.file(
                    File(controller.imagePath.value),
                    height: 100.h,
                    width: 100.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: -10.h,
                    // Position the delete button slightly above the image
                    right: -10.h,
                    // Position the delete button slightly to the right
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // White background color for the button
                        shape: BoxShape.circle, // Circular shape
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            controller.imagePath.value =
                                ''; // Clear the image path when pressed
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
          SizedBox(
            height: 20.h,
          ),
          Obx(
            () => CustomButton(
              onPressed: controller.pickImage,
              label: controller.imagePath.value.isEmpty
                  ? "Pick Image"
                  : "update Image",
              color: Colors.blue, // Customize the color
            ),
          ),

          SizedBox(height: 10.h), // Spacer between buttons

          Obx(() => controller.imagePath.value.isEmpty
              ? Container()
              : CustomButton(
                  onPressed: controller.saveNote,
                  label: "Save Note",
                  color: Colors.green, // Customize the color
                )),
          const Divider(),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.notes.length,
                  itemBuilder: (_, index) {
                    final note = controller.notes[index];
                    return NotWidget(
                      note: note,
                      onDelete: () => controller.deleteNote(index),
                      onEdit: () => showEditDialog(context, index, note),
                      onView: () => Get.to(() => NoteDetailsScreen(note: note)),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
