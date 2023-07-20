import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/view/notes_view.dart';
import 'package:note_app/view/widgets/custom_appbar.dart';

import 'custom_textfield.dart';

class EditViewBody extends StatefulWidget {
  final NoteModel note;

  const EditViewBody({super.key, required this.note});

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(
            height: 65,
          ),
          CustomAppBar(
            title: "Edit Note",
            icon: Icons.check,
            onpressd: () {
              widget.note.title=title??widget.note.title;
              widget.note.content=content??widget.note.content;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);

            },
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hint: widget.note.content,
            maxLines: 5,
          )
        ],
      ),
    );
  }
}
