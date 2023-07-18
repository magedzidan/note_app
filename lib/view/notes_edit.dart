import 'package:flutter/material.dart';
import 'package:note_app/view/widgets/edit_view_body.dart';

class NotesEditView extends StatelessWidget {
  const NotesEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditViewBody(),
    );
  }
}

