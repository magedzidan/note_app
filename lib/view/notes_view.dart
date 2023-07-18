import 'package:flutter/material.dart';
import 'package:note_app/view/widgets/constants.dart';
import 'package:note_app/view/widgets/custom_button.dart';
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
                  return AddBottomSheet();
                });
          },
          child: Icon(Icons.add)),
      body: NotesViewBody(),
    );
  }
}

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
        SizedBox(
          height: 40,
        ),
        CustomTextField(
          hint: "Title",
        ),
        SizedBox(
          height: 30,
        ),
        CustomTextField(
          hint: "Content",
          maxLines: 5,
        ),
        SizedBox(
          height: 10,
        ),
        CustomButton(),
        SizedBox(
          height: 15,
        ),
      ]),
    );
  }
}


class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged});

  final String hint;
  final int maxLines;

  final void Function(String?)? onSaved;

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required ';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: BorderSide(
          color: kPrimaryColor ?? Colors.white,
        ));
  }
}
