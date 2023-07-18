import 'package:flutter/material.dart';
import 'package:note_app/view/widgets/custom_appbar.dart';
import 'package:note_app/view/widgets/note_item.dart';
class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: 80,),
            CustomAppBar(title: "Note",icon: Icons.search),
            NotesList(),
            
            
        ],
      ),
    );
  }
}

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:0.0),
        child: ListView.separated(itemBuilder: (context, index) {
          Padding:EdgeInsets.zero;
            return  NoteItem();
            
        },separatorBuilder:(context, index) => SizedBox(height: 10,),
        itemCount: 10,
        ),
      ),
    );
  }
}
