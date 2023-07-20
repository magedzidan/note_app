import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/view/notes_edit.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;

  const NoteItem({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NotesEditView(
            note: note,
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListTile(
            title: Text(
              '${note.title as String}',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Text('${note.content as String}',
                  style: TextStyle(
                      color: Colors.black.withOpacity(.5), fontSize: 16)),
            ),
            trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 32,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text('${note.date as String}',
                style: TextStyle(
                    color: Colors.black.withOpacity(.4), fontSize: 16)),
          ),
        ]),
      ),
    );
  }
}

