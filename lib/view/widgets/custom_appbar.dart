import 'package:flutter/material.dart';
import 'package:note_app/view/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String title ;
  final IconData icon ;
  final void Function()? onpressd;
  const CustomAppBar({super.key, required this.title, required this.icon, this.onpressd});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 32),
        ),
        Spacer(),
        CustomSearchIcon(icon: icon,onpressed: onpressd,),
      ],
    );
  }
}
