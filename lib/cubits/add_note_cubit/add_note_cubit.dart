import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/view/widgets/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  
  bool isLoading=true;

  addNote(NoteModel note)async{
    emit(AddNoteLoading() );
    try {
  var notesBooks=  Hive.box<NoteModel>(kNotesBox);
  await  notesBooks.add(note);
  isLoading=false;
  emit(AddNoteSuccess());
} on Exception catch (e) {
    isLoading=false;
   emit(AddNoteFaliure(e.toString()));

}
  }
}
