
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24,bottom: 24,left: 16),
      decoration: BoxDecoration(
        color: Color(0xffFFCC80),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.end,
        children: [
        ListTile(

          title: const Text(
            'Flutter Tips',
            style:  TextStyle(color: Colors.black, fontSize: 26),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:16.0,bottom: 16.0),
            child: Text('Build Your Carrer with thatrwat samy',
                style:  TextStyle(color: Colors.black.withOpacity(.5),
                                  fontSize: 16)),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon:const Icon(
                Icons.delete,
                color: Colors.black,
                size: 32,
              )),
        ),
       Padding(
         padding: const EdgeInsets.only(right:24.0),
         child: Text('May21, 2020', style: TextStyle(color: Colors.black.withOpacity(.4),fontSize: 16)),
       ),
      ]),
    );
  }
}

