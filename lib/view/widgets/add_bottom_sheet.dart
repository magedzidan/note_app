import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/view/widgets/add_noteform.dart';

class AddBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFaliure) {}
          ;
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
          ;
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ?true:false,
            
            child: SingleChildScrollView(child: Padding(
              padding:  EdgeInsets.only(right:16.0,left:16.0,bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddNoteForm(),
            )),
          );
        },
      ),
    );
  }
}
