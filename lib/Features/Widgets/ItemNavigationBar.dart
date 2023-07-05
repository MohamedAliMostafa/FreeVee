import 'package:flutter/material.dart';

class ItemNaviBar extends StatelessWidget {
  IconData icons;
  String label;


  ItemNaviBar({required this.icons, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icons,color: const Color(0xffC6C6C6),size: 15,),
        Text(label,style: const TextStyle(color: Color(0xffC6C6C6),fontSize: 12,fontWeight: FontWeight.bold))
      ],
    );
  }
}
