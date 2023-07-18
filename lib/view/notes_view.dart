import 'package:flutter/material.dart';
import 'package:note_app/view/widgets/constants.dart';
import 'package:note_app/view/widgets/custom_button.dart';
import 'package:note_app/view/widgets/custom_textfield.dart';
import 'package:note_app/view/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                context: context,
                builder: (context) {
                  return const AddBottomSheet();
                });
          },
          child: const Icon(Icons.add)),
      body: const NotesViewBody(),
    );
  }
}

class AddBottomSheet extends StatefulWidget {
  const  AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: AddNoteForm(),
    );
  }
}

class AddNoteForm extends StatefulWidget {
   AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey=GlobalKey();

  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

  String? title,subtitle;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child:  Column(
        children: [
        SizedBox(
          height: 40,
        ),
        CustomTextField(
          hint: "Title",
          onSaved: (value){
            title=value;
          },
        ),
        SizedBox(
          height: 30,
        ),
        CustomTextField(
          hint: "Content",
            onSaved: (value){
            subtitle=value;
          },
          maxLines: 5,
        ),
        SizedBox(
          height: 10,
        ),
        CustomButton(
          onTap: (){
            if(formKey.currentState!.validate()){
              formKey.currentState!.save();
            }
            else{
              autovalidateMode=AutovalidateMode.always;
              setState((){

              });
            }
          },
        ),
        SizedBox(
          height: 15,
        ),
      ]),
    );
  }
}

