import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../home/const.dart';

class MyButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  var bottomColor = Colors.white;
   MyButton({super.key,required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if(child=='C'){
      bottomColor=Colors.red;
    }else if(child =='Del') {
 bottomColor=Colors.green;
    }else if(child == '='){
      bottomColor=Colors.yellow;
    }
    return Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap:onTap ,
                  child: Container(
                    decoration: BoxDecoration(
                      color: bottomColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child:Center(child: Text(child,style: whiteTextStyle,)) ,
                  ),
                ),
              );
  }
}