import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(children: [
        SizedBox(
          height: 40,
        ),
        CustomTextField(
          hint: "Title",
          onSaved: (value) {
            title = value;
          },
        ),
        SizedBox(
          height: 30,
        ),
        CustomTextField(
          hint: "Content",
          onSaved: (value) {
            subtitle = value;
          },
          maxLines: 5,
        ),
        SizedBox(
          height: 10,
        ), 
        BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            return CustomButton(
              isLoading:state is AddNoteLoading ? true : false,

              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var datenow=DateTime.now();
                  // var formated_Date=DateFormat.yMEd().format(datenow);
                  var formated_Date=DateFormat('dd-mm-yyyy').format(datenow);
                  NoteModel noteModel = NoteModel(
                      title: title!,
                      content: subtitle!,
                      date: formated_Date.toString(),
                      color: Colors.blue.value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            );
          },
        ),
        SizedBox(
          height: 15,
        ),
      ]),
    );
  }
}
