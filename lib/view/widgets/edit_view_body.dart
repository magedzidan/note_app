import 'package:flutter/material.dart';
import 'package:note_app/view/notes_view.dart';
import 'package:note_app/view/widgets/custom_appbar.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:24.0),
      child: Column(
        children: [
          SizedBox(height: 65,),
          CustomAppBar(title: "Edit Note",icon: Icons.check,),
          SizedBox(height: 30,),
          CustomTextField(hint: 'Title'),
          SizedBox(height: 16,),
          CustomTextField(hint: "Content",maxLines: 5,)
        ],
      ),
    );
  }
}