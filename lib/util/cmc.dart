import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../home/const.dart';

class Cmc extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  final icon;
  const Cmc({super.key,required this.icon,required this.message,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
  backgroundColor:  Colors.black,
  content: GestureDetector(
    onTap: onTap,
    child: Container(
      height: 200,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Правильно!",style: whiteTextStyle,),
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(color: Colors.black,
          borderRadius: BorderRadius.circular(22)),
  child: Icon(icon,
  color: Colors.white,),
        )
  
        ],
      ),
    ),
  ),
);
  }
}