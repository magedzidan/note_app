import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';

import '../../cubits/notes/notes_cubit.dart';
import 'note_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
         List<NoteModel>? notes= BlocProvider.of<NotesCubit>(context).notes;
         print(notes?.length);
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: ListView.builder(
              itemCount:   notes?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical:4.0),
                  child: NoteItem(note:notes![index]),
                );
              },
            
            ),
          ),
        );
      },
    );
  }
}
