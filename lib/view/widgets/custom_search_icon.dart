
import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
    final IconData icon ;
    final void Function()? onpressed ;
  const CustomSearchIcon({super.key, required this.icon, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:45 ,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(12)
      ),
      child: IconButton(
        onPressed: onpressed,
      icon: Icon(icon ,size: 28,) ,
       
      ),
    );
  }
}