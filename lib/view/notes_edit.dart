import 'package:flutter/material.dart';
import 'package:note_app/view/widgets/edit_view_body.dart';

import '../models/note_model.dart';

class NotesEditView extends StatelessWidget {
  final NoteModel note;

  const NotesEditView({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditViewBody(
        note: note,
      ),
    );
  }
}

