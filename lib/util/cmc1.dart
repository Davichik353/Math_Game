import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../home/const.dart';

class Cmc2 extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  final icon;
  const Cmc2({super.key,required this.icon,required this.message,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
  backgroundColor:  Colors.white,
  content: GestureDetector(
    onTap: onTap,
    child: Container(
      height: 200,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Тупой подумай еще!",style: TextStyle(
            color: Colors.white,
             fontWeight: FontWeight.bold,
      fontSize: 32,
          ),),
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(22)),
  child: Icon(icon,
  color: Colors.black,),
        )
  
        ],
      ),
    ),
  ),
);
  }
}