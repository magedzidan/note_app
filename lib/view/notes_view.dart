import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/view/widgets/add_bottom_sheet.dart';
import 'package:note_app/view/widgets/add_noteform.dart';
import 'package:note_app/view/widgets/constants.dart';
import 'package:note_app/view/widgets/custom_button.dart';
import 'package:note_app/view/widgets/custom_textfield.dart';
import 'package:note_app/view/widgets/notes_view_body.dart';

import '../cubits/notes/notes_cubit.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                context: context,
                builder: (context) {
                  return AddBottomSheet();
                });
          },
          child: const Icon(Icons.add)),
      body: const NotesViewBody(),
    );
  }
}
